// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# Object Storage parameters
bucket_params = {
  bucket_mlflow = {
    compartment_name = "my_compartment"
    name             = "bucket_mlflow"
    access_type      = "NoPublicAccess"
    storage_tier     = "Standard"
    events_enabled   = false
    kms_key_name     = ""
  }
}
