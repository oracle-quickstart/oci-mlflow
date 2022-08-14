// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "compartment_ids" {
  type = map(string)
}

variable "subnet_ids" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "ssh_private_key" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "database_ip" {
  type = string
}

variable "linux_images" {
  type = map(string)
}

variable "nsgs" {
  type = map(string)
}

variable "dbname" {
  type = string
}

variable "mysql_mlflow_username" {
  type = string
}

variable "mysql_mlflow_password" {
  type = string
}

variable "bucket-url" {
  type = string
}

variable "database_port" {
  type = string
}

variable "instance_params" {
  description = "Placeholder for the parameters of the instances"
  type = map(object({
    ad                   = number
    shape                = string
    memory_in_gbs        = number
    ocpus                = number	
    hostname             = string
    assign_public_ip     = bool
    preserve_boot_volume = bool
    compartment_name     = string
    subnet_name          = string
    device_disk_mappings = string
    freeform_tags        = map(string)
    kms_key_name         = string
    block_vol_att_type   = string
    encrypt_in_transit   = bool
    fd                   = number
    image_version        = string
    nsgs                 = list(string)
  }))
}

variable "kms_key_ids" {
  type = map(string)
}

variable "mds_params" {
  description = "Placeholder for the parameters of the mysql database"
  type = map(object({
    display_name             = string
    ad                       = number
    config_name              = string
    shape                    = string
    backup_defined_tags      = map(string)
    backup_freeform_tags     = map(string)
    backup_policy_is_enabled = bool
    retention_in_days        = number
    backup_start_time        = string
    data_storage_size        = number
    defined_tags             = map(string)
    freeform_tags            = map(string)
    hostname_label           = string
    ip_address               = string
    # maintenance_start_time   = string
    port             = number
    port_x           = number
    compartment_name = string
    subnet_name      = string
    fd               = number
  }))
}

variable "provider_oci" {
  type = map(string)
}

variable "s3" {
  type = map(string)
}

variable "username" {
  type = string
}

variable "authtoken" {
  type = string
}

variable "mysql_admin_username" {
  type = string
}

variable "mysql_admin_password" {
  type = string
}

variable "repo_name" {
  type = string
}
