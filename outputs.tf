// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# Network

output "network_vcns" {
  value = module.network.vcns
}

output "subnet_ids" {
  value = module.network.subnet_ids
}


# Instances

output "compute_linux_instances" {
  value = module.instances.linux_instances
}


# Object Storage

output "buckets" {
  value = module.object_storage.buckets
}


# MySQL Database System

output "mds" {
  value = module.mds.database
}
