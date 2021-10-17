// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

dbname    = "mlflow"
repo_name = "mlflow_repo"

# Instances parameters
instance_params = {
  dev = {
    ad                   = 1
    shape                = "VM.Standard2.4"
    hostname             = "dev"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = true
    compartment_name     = "my_compartment"
    subnet_name          = "sb_mlflow"
    device_disk_mappings = "/u01:/dev/oracleoci/oraclevdb"
    freeform_tags = {
      "client" : "mlflow",
      "department" : "mlflow"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  tracking = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "tracking"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = true
    compartment_name     = "my_compartment"
    subnet_name          = "sb_mlflow"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "mlflow",
      "department" : "mlflow"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  training = {
    ad                   = 1
    shape                = "VM.Standard2.8"
    hostname             = "training"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = true
    compartment_name     = "my_compartment"
    subnet_name          = "sb_mlflow"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "mlflow",
      "department" : "mlflow"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  serving = {
    ad                   = 1
    shape                = "VM.Standard2.2"
    hostname             = "serving"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = true
    compartment_name     = "my_compartment"
    subnet_name          = "sb_mlflow"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "mlflow",
      "department" : "mlflow"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
}

kms_key_ids = {}

linux_images = {
  # Oracle-Linux-8.3-2021.04.09-0
  # from https://docs.oracle.com/en-us/iaas/images/image/4614a02a-646a-4d99-8dc5-98788d79407e/
  ap-chuncheon-1 = "ocid1.image.oc1.ap-chuncheon-1.aaaaaaaa44jvpxpsxq5y7r5g5weqbd4am7ex7on22k6rhtwukajaazs3thzq"
  ap-hyderabad-1 = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaamlxgbmvt27jtjcjg3gkjjuegh5b4ykpmm6bi6fscittqygwdeyoq"
  ap-melbourne-1 = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaartypv5rdpznrtuqinrnomkfb3zc5rvvixjfs6oaekabgd4gtrbza"
  ap-mumbai-1    = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaalntjwkxasjjclwrfjvaijpi3z4jr4sdhn2ncirvhnfdpnrl52yjq"
  ap-osaka-1     = "ocid1.image.oc1.ap-osaka-1.aaaaaaaarymy52j6jqibxtc6zafmognlnlm5v2ajf7opj56tscuxtzsujj2q"
  ap-seoul-1     = "ocid1.image.oc1.ap-seoul-1.aaaaaaaae24hkuimhzagppuvgy3jaogekf5ckt6ylhdtjzggpno63w7t5y7q"
  ap-sydney-1    = "ocid1.image.oc1.ap-sydney-1.aaaaaaaaojcpwhjh5lrp25w2idrgf2oyuruoj3nk2ps7oqznqsrzmy6czvja"
  ap-tokyo-1     = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaayqtcou4znbga2vq2f7ftsoi6kptzqluvkkp5lxocher2io6ufzpq"
  ca-montreal-1  = "ocid1.image.oc1.ca-montreal-1.aaaaaaaah4v67ivegln3vxbv2cenuqncfy6qxyqyv5coj4pnsd6ays5bnqna"
  ca-toronto-1   = "ocid1.image.oc1.ca-toronto-1.aaaaaaaarg6hewzxsm443ljxow4ut25fyqppvlx6ngrdp3ote3qj64sjbyha"
  eu-amsterdam-1 = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaazgjec23hqygh4ceq2fuhn4jtcefruc3cwfa2xhvad6j7s6vsc3qq"
  eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaayhguexwfyuilmgxoori3wz63vdjja4n3eydy6fcte3blw66enha"
  eu-zurich-1    = "ocid1.image.oc1.eu-zurich-1.aaaaaaaauvcvsbzzhwhhibz3yo4z5ynzlzfldvviizvdlpc64tlcymev2rra"
  me-dubai-1     = "ocid1.image.oc1.me-dubai-1.aaaaaaaaroy5somyw34zpbyy6ewqdpby4z6ccenazq5ubu6if55highk4hlq"
  me-jeddah-1    = "ocid1.image.oc1.me-jeddah-1.aaaaaaaa65un7dguqgopicw3nantlgwhkyj7aq2i5ucelsj5n2vsv4xfel4a"
  sa-santiago-1  = "ocid1.image.oc1.sa-santiago-1.aaaaaaaao7dkdzz52inxu3popeqsuvg5rgudprcupecqtiz677ryzcqypnjq"
  sa-saopaulo-1  = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaa2sbik6rns7hg3im7l3pgttluvauzut4sx4cllk2tvzusowjliboq"
  uk-cardiff-1   = "ocid1.image.oc1.uk-cardiff-1.aaaaaaaaqg34dgzhnhjo6ba4wrbj4r2kl4kztcdsdmhhi3fcruvpycxe5lka"
  uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaann2kwlweidx6eaivj4rhouauk32sg77kgdsnlgtikgeqrebkjlda"
  us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaapxf2h62uxysjewwrgo5tkohb5frlf2wpzawmxgncxdy7vwnm7aza"
  us-langley-1   = "ocid1.image.oc2.us-langley-1.aaaaaaaa3tybpgwbmvk5ickxouakcxwygmo5lcdbo53rpn63v5lby64a4u2a"
  us-luke-1      = "ocid1.image.oc2.us-luke-1.aaaaaaaaerxzt37g53sp5dgvhj5ih5ly6dz6q45vvg3inakgeyf53b6buzyq"
  us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaawoukngwpvd4llmgxmtmvmben73bhym62lunqe6jadc4ujq3z3c5q"
  us-sanjose-1   = "ocid1.image.oc1.us-sanjose-1.aaaaaaaanhd3rstslr26d2g4fzp75azowoedsf5hzb3pqj6qximwcfvdwvqq"
}
