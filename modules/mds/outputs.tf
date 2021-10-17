// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "database" {
  value = {
    for db in oci_mysql_mysql_db_system.this :
    db.display_name => { "ocid" : db.id, "ip_address" : db.endpoints[0].ip_address, "hostname" : db.endpoints[0].hostname }
  }
}


output "database_ip" {
  value = oci_mysql_mysql_db_system.this["mlflow"].endpoints[0].ip_address
}

output "database_port" {
  value = oci_mysql_mysql_db_system.this["mlflow"].endpoints[0].port
}
