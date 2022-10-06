// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# MySQL Database Service (MDS) parameters

configurations = {
  "VM.Standard.E2.1" = "ocid1.mysqlconfiguration.oc1..aaaaaaaah6o6qu3gdbxnqg6aw56amnosmnaycusttaa7abyq2tdgpgubvsgi"
  "VM.Standard.E2.2" = "ocid1.mysqlconfiguration.oc1..aaaaaaaah6o6qu3gdbxnqg6aw56amnosmnaycusttaa7abyq2tdgpgubvsgj"
  "VM.Standard.E2.4" = "ocid1.mysqlconfiguration.oc1..aaaaaaaah6o6qu3gdbxnqg6aw56amnosmnaycusttaa7abyq2tdgpgubvsgk"
  "VM.Standard.E2.8" = "ocid1.mysqlconfiguration.oc1..aaaaaaaah6o6qu3gdbxnqg6aw56amnosmnaycusttaa7abyq2tdgpgubvsgl"
}

mds_params = {
  mlflow = {
    ad                       = 1
    display_name             = "mlflow"
    config_name              = "VM.Standard.E2.2"
    shape                    = "VM.Standard.E2.2"
    backup_defined_tags      = {}
    backup_freeform_tags     = {}
    backup_policy_is_enabled = true
    retention_in_days        = null
    backup_start_time        = null
    data_storage_size        = 50
    defined_tags             = {}
    freeform_tags            = {}
    hostname_label           = "mlflow"
    ip_address               = ""
    #maintenance_start_time   = "MONDAY 05:36"
    port             = null
    port_x           = null
    compartment_name = "my_compartment"
    subnet_name      = "sb_mlflow_private"
    fd               = 1
  },
}
