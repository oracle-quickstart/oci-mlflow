// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "provider_oci" {
  type = map(string)
}

variable "s3" {
  type = map(string)
}

variable "compartment_ids" {
  type = map(string)
}

variable "s3_compartment_ids" {
  type = map(string)
}

# Network parameters
variable "vcn_params" {
  description = "VCN Parameters: vcn_cidr, display_name, dns_label"
  type = map(object({
    vcn_cidr         = string
    compartment_name = string
    display_name     = string
    dns_label        = string
  }))
}

variable "igw_params" {
  description = "Placeholder for vcn index association and igw name"
  type = map(object({
    vcn_name     = string
    display_name = string
  }))
}

variable "ngw_params" {
  description = "Placeholder for vcn index association and ngw name"
  type = map(object({
    vcn_name     = string
    display_name = string
  }))
}

variable "rt_params" {
  description = "Placeholder for vcn index association, rt name, route rules"
  type = map(object({
    vcn_name     = string
    display_name = string
    route_rules = list(object({
      destination = string
      use_igw     = bool
      igw_name    = string
      ngw_name    = string
    }))
  }))
}

variable "sl_params" {
  description = "Security List Params"
  type = map(object({
    vcn_name     = string
    display_name = string
    egress_rules = list(object({
      stateless   = string
      protocol    = string
      destination = string
    }))
    ingress_rules = list(object({
      stateless   = string
      protocol    = string
      source      = string
      source_type = string
      tcp_options = list(object({
        min = number
        max = number
      }))
      udp_options = list(object({
        min = number
        max = number
      }))
    }))
  }))
}

variable "nsg_params" {
  type = map(object({
    vcn_name     = string
    display_name = string
  }))
}

variable "nsg_rules_params" {
  type = map(object({
    nsg_name         = string
    protocol         = string
    stateless        = string
    direction        = string
    source           = string
    source_type      = string
    destination      = string
    destination_type = string
    tcp_options = list(object({
      destination_ports = list(object({
        min = number
        max = number
      }))
      source_ports = list(object({
        min = number
        max = number
      }))
    }))
    udp_options = list(object({
      destination_ports = list(object({
        min = number
        max = number
      }))
      source_ports = list(object({
        min = number
        max = number
      }))
    }))
  }))
}

variable "subnet_params" {
  type = map(object({
    display_name      = string
    cidr_block        = string
    dns_label         = string
    is_subnet_private = bool
    sl_name           = string
    rt_name           = string
    vcn_name          = string
  }))
}

variable "lpg_params" {
  type = map(object({
    acceptor     = string
    requestor    = string
    display_name = string
  }))
}

variable "drg_params" {
  type = map(object({
    name     = string
    vcn_name = string
    cidr_rt  = string
    rt_names = list(string)
  }))
}

# Instances parameters

variable "ssh_private_key" {
  type = string
}

variable "ssh_public_key" {
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

variable "linux_images" {
  type = map(string)
}

# Object Storage parameters
variable "bucket_params" {
  type = map(object({
    compartment_name = string
    name             = string
    access_type      = string
    storage_tier     = string
    events_enabled   = bool
    kms_key_name     = string
  }))
}

# MySQL Database Service (MDS) parameters


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

variable "configurations" {
  type = map(any)
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

variable "bucket_prefix" {
  type = string
}
