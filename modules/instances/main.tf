// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
locals {
  block_performance = {
    Low      = "0"
    Balanced = "10"
    High     = "20"
  }

  tracking_bastion_host = "tracking"
  region_registry      = [for el in data.oci_identity_regions.test_regions.regions : lower(el.key) if el.name == var.provider_oci.region][0]
  tenancy_name         = data.oci_identity_tenancy.test_tenancy.name
  anaconda_miniconda = {
    "serving"  = "miniconda_install.sh"
    "tracking" = "miniconda_install.sh"
  }
}

data "oci_identity_regions" "test_regions" {
}

data "oci_identity_tenancy" "test_tenancy" {
  tenancy_id = var.provider_oci.tenancy
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ids[var.instance_params[keys(var.instance_params)[0]].compartment_name]
  #compartment_id = var.compartment_ids["my_compartment"]
}

resource "oci_core_instance" "this" {
  for_each                            = var.instance_params
  availability_domain                 = data.oci_identity_availability_domains.ads.availability_domains[each.value.ad - 1].name
  compartment_id                      = var.compartment_ids[each.value.compartment_name]
  shape                               = each.value.shape
  display_name                        = each.value.hostname
  preserve_boot_volume                = each.value.preserve_boot_volume
  freeform_tags                       = each.value.freeform_tags
  is_pv_encryption_in_transit_enabled = each.value.encrypt_in_transit
  fault_domain                        = format("FAULT-DOMAIN-%s", each.value.fd)


  create_vnic_details {
    assign_public_ip = each.value.assign_public_ip
    subnet_id        = var.subnet_ids[each.value.subnet_name]
    hostname_label   = each.value.hostname
    nsg_ids          = [for nsg in each.value.nsgs : var.nsgs[nsg]]
  }

  shape_config {
    memory_in_gbs = each.value.memory_in_gbs
    ocpus         = each.value.ocpus
  }

  source_details {
    source_type             = "image"
    source_id               = var.linux_images[var.region]
    kms_key_id              = length(var.kms_key_ids) == 0 || each.value.kms_key_name == "" ? "" : var.kms_key_ids[each.value.kms_key_name]
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
  }

  connection {
    host        = self.public_ip
    private_key = file(var.ssh_private_key)
    timeout     = "600s"
    type        = "ssh"
    user        = "opc"
  }
  
  provisioner "remote-exec" {
    inline = [
      "mkdir userdata",
    ]
  }

  # docker files
  provisioner "remote-exec" {
    inline = [
      "mkdir docker",
    ]
  }

  provisioner "file" {
    source      = "${path.module}/../../userdata/docker/${local.anaconda_miniconda[each.value.hostname]}"
    destination = "docker/${local.anaconda_miniconda[each.value.hostname]}"
  }

  provisioner "file" {
    source      = "${path.module}/../../userdata/docker/Dockerfile-${each.value.hostname}"
    destination = "docker/Dockerfile"
  }

  # docker
  provisioner "remote-exec" {
    inline = [
      # install
      "sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
      "sudo yum install docker-ce docker-ce-cli containerd.io -y",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      # login
      "echo '${var.authtoken}' | sudo docker login --username=${local.tenancy_name}/${var.username} --password-stdin  ${local.region_registry}.ocir.io",
    ]
  }

  # docker build
  provisioner "remote-exec" {
    inline = [
      "cd docker",
      "sudo docker build -t mlflow-${each.value.hostname}:0.0.1 .",
      "sudo docker tag mlflow-${each.value.hostname}:0.0.1 ${local.region_registry}.ocir.io/${local.tenancy_name}/${var.repo_name}/mlflow-${each.value.hostname}:0.0.1",
      "sudo docker push ${local.region_registry}.ocir.io/${local.tenancy_name}/${var.repo_name}/mlflow-${each.value.hostname}:0.0.1",
    ]
  }

   lifecycle {
    ignore_changes = [availability_domain]
  }
}

data "template_file" "mysql_user_templates" {
  template = file("${path.module}/../../userdata/mysql_init.tpl")

  vars = {
    dbname     = var.dbname
    mysql_mlflow_username     = var.mysql_mlflow_username
    mysql_mlflow_password = var.mysql_mlflow_password
  }
}

resource "null_resource" "tracking_bastion" {
  connection {
    host        = oci_core_instance.this[local.tracking_bastion_host].public_ip
    private_key = file(var.ssh_private_key)
    timeout     = "180s"
    type        = "ssh"
    user        = "opc"
  }
  
  # bastion
  provisioner "file" {
    content     = data.template_file.mysql_user_templates.rendered
    destination = "mysql_init.sql"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm -y",
      "sudo yum install mysql-shell -y",
      "sudo yum install mysql -y",
      "sudo mysql --user=${var.mysql_admin_username} --password=${var.mysql_admin_password} --host=${var.database_ip} < mysql_init.sql",
    ]
  }
}

resource "null_resource" "commands" {
  for_each = var.instance_params

  connection {
    host        = oci_core_instance.this[each.value.hostname].public_ip
    private_key = file(var.ssh_private_key)
    timeout     = "180s"
    type        = "ssh"
    user        = "opc"
  }

  # commands file
  provisioner "file" {
    content     = data.template_file.commands_template[each.value.hostname].rendered
    destination = "commands.txt"
  }
}

data "template_file" "commands_template" {
  for_each = var.instance_params

  template = file("${path.module}/../../userdata/cmds-${each.value.hostname}.tpl")

  vars = {
    dbname          = var.dbname
    mysql_mlflow_username          = var.mysql_mlflow_username
    mysql_mlflow_password      = var.mysql_mlflow_password
    tracking        = oci_core_instance.this["tracking"].public_ip
    serving         = oci_core_instance.this["serving"].public_ip
	  s3_endpoint_url = var.s3.endpoint_url
    bucket-url      = var.bucket-url
    database_port   = var.database_port
    database_ip     = var.database_ip
    region_registry = local.region_registry
    tenancy_name    = local.tenancy_name
    repo_name       = var.repo_name
  }
}
