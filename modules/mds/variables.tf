// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "compartment_ids" {
  type = map(string)
}

variable "subnet_ids" {
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

variable "configurations" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "mysql_admin_username" {
  type = string
}

variable "mysql_admin_password" {
  type = string
}
