
// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ids[var.mds_params[keys(var.mds_params)[0]].compartment_name]
}

data "oci_mysql_mysql_configurations" "exists" {
  compartment_id = var.compartment_ids[var.mds_params[keys(var.mds_params)[0]].compartment_name]
}

resource "oci_mysql_mysql_db_system" "this" {
  for_each            = var.mds_params
  admin_password      = var.mysql_admin_password
  admin_username      = var.mysql_admin_username
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[each.value.ad - 1].name
  compartment_id      = var.compartment_ids[each.value.compartment_name]
  configuration_id    = var.configurations[each.value.config_name]
  shape_name          = each.value.shape
  subnet_id           = var.subnet_ids[each.value.subnet_name]

  backup_policy {
    defined_tags      = each.value.backup_defined_tags
    freeform_tags     = each.value.backup_freeform_tags
    is_enabled        = each.value.backup_policy_is_enabled
    retention_in_days = each.value.retention_in_days
    window_start_time = each.value.backup_start_time
  }

  data_storage_size_in_gb = each.value.data_storage_size
  defined_tags            = each.value.defined_tags
  display_name            = each.value.display_name
  fault_domain            = format("FAULT-DOMAIN-%s", each.value.fd)
  freeform_tags           = each.value.freeform_tags
  hostname_label          = each.value.hostname_label
  ip_address              = each.value.ip_address
  # maintenance {
  #   window_start_time = each.value.maintenance_start_time
  # }
  port   = each.value.port
  port_x = each.value.port_x
}
