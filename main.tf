// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

provider "oci" {
  tenancy_ocid     = var.provider_oci.tenancy
  user_ocid        = var.provider_oci.user_id
  fingerprint      = var.provider_oci.fingerprint
  private_key_path = var.provider_oci.key_file_path
  region           = var.provider_oci.region
}

module "network" {
  source           = "./modules/network"
  compartment_ids  = var.compartment_ids
  vcn_params       = var.vcn_params
  igw_params       = var.igw_params
  ngw_params       = var.ngw_params
  rt_params        = var.rt_params
  sl_params        = var.sl_params
  nsg_params       = var.nsg_params
  nsg_rules_params = var.nsg_rules_params
  subnet_params    = var.subnet_params
  lpg_params       = var.lpg_params
  drg_params       = var.drg_params
}

module "instances" {
  source          = "./modules/instances"
  compartment_ids = var.compartment_ids
  subnet_ids      = module.network.subnet_ids
  nsgs            = module.network.nsgs
  instance_params = var.instance_params
  linux_images    = var.linux_images
  region          = var.provider_oci.region
  kms_key_ids     = var.kms_key_ids
  ssh_private_key = var.ssh_private_key
  ssh_public_key  = var.ssh_public_key
  database_ip     = module.mds.database_ip
  mds_params      = var.mds_params
  depends_on      = [module.mds]
  dbname          = var.dbname
  mysql_mlflow_username  = var.mysql_mlflow_username
  mysql_mlflow_password  = var.mysql_mlflow_password
  provider_oci    = var.provider_oci
  s3              = var.s3
  username        = var.username
  authtoken       = var.authtoken
  bucket-url      = module.object_storage.bucket-url
  database_port   = module.mds.database_port
  mysql_admin_username  = var.mysql_admin_username
  mysql_admin_password  = var.mysql_admin_password
  repo_name       = var.repo_name
}

module "object_storage" {
  source        = "./modules/object_storage"
  compartments  = var.s3_compartment_ids
  bucket_params = var.bucket_params
  oci_provider  = var.provider_oci
  kms_key_ids   = var.kms_key_ids
  bucket_prefix = var.bucket_prefix
}

module "mds" {
  source          = "./modules/mds"
  compartment_ids = var.compartment_ids
  subnet_ids      = module.network.subnet_ids
  mds_params      = var.mds_params
  region          = var.provider_oci.region
  configurations  = var.configurations
  mysql_admin_username  = var.mysql_admin_username
  mysql_admin_password  = var.mysql_admin_password
}
