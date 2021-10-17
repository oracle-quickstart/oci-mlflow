// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "vcns" {
  value = {
    for vcn in oci_core_virtual_network.vcn :
    vcn.display_name => tomap({ "id" = vcn.id, "cidr" = vcn.cidr_block })
  }
}

output "subnets" {
  value = {
    for subnet in oci_core_subnet.subnets :
    subnet.display_name => tomap({ (subnet.id) = subnet.cidr_block })
  }
}

output "subnet_ids" {
  value = {
    for subnet in oci_core_subnet.subnets :
    subnet.display_name => subnet.id
  }
}

output "drgs" {
  value = {
    for drg in oci_core_drg.this :
    drg.display_name => drg.id
  }
}

output "nsgs" {
  value = {
    for nsg in oci_core_network_security_group.nsg :
    nsg.display_name => nsg.id
  }
}
