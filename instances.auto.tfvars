// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

dbname    = "mlflow"
repo_name = "mlflow_repo"

# Instances parameters
instance_params = {
  dev = {
    ad                   = 1
    shape                = "VM.Standard.E4.Flex"
    memory_in_gbs        = 64
    ocpus                = 4	
    hostname             = "dev"
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
    shape                = "VM.Standard.E4.Flex"
    memory_in_gbs        = 32
    ocpus                = 2	
    hostname             = "tracking"
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
    shape                = "VM.Standard.E4.Flex"
    memory_in_gbs        = 128
    ocpus                = 8	
    hostname             = "training"
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
    shape                = "VM.Standard.E4.Flex"
    memory_in_gbs        = 32
    ocpus                = 2	
    hostname             = "serving"
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
  # Oracle-Linux-8.6-2022.06.30-0
  # from https://docs.oracle.com/en-us/iaas/images/image/c05db6fa-d8ad-40b1-85b1-27f7445c595b/
  af-johannesburg-1 = "ocid1.image.oc1.af-johannesburg-1.aaaaaaaag7l4xrxms2neo2gf4mpfqm7f5tav7crecsvhnfjqe34u6os3632a"
  ap-chuncheon-1    = "ocid1.image.oc1.ap-chuncheon-1.aaaaaaaa3glqhhh5jdvddu2ziaxqg33l2euytsrf2i7ic2u5zubzief4huba"
  ap-hyderabad-1    = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaaazvazi2jxhycdytvpd3xba5wodla2uvwnhiozrxua27afz7rx4sa"
  ap-melbourne-1    = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaahthmrgdmzbfhcdhoh5qigkww7rkdrrxjzs4nanqpbw2ownufeztq"
  ap-mumbai-1       = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaax4zwndsh2fxphpntvqrmd53b5jblrk7p7rnpheybfooru7dl44eq"
  ap-osaka-1        = "ocid1.image.oc1.ap-osaka-1.aaaaaaaamjegyyhjc2gvr5slncagaa3p3t3bflvr5d4gq7qd7bc55d666jwq"
  ap-seoul-1        = "ocid1.image.oc1.ap-seoul-1.aaaaaaaabm6rdzv62mv4bqrvjru6vn6xbxzpgkuk233p6sbmdygu3jgeio5q"
  ap-singapore-1    = "ocid1.image.oc1.ap-singapore-1.aaaaaaaa24kt57fctr2tnn52yk2qzhzi2jgeubdha73okkevr5qvp4jlin4a"
  ap-sydney-1       = "ocid1.image.oc1.ap-sydney-1.aaaaaaaaqvr3nbcb4tmh4xk2x6thenvzswrmiqz6w2usc33lae3z2etlbyea"
  ap-tokyo-1        = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaapuh5ruwocs5qb2j6nancpwvujepbvvwjoe7u6hbrce6wowqflzva"
  ca-montreal-1     = "ocid1.image.oc1.ca-montreal-1.aaaaaaaafrpeepegyy3o4nn6x7ec5hq7y7njyj3s7elnnr5qicfahrgk73bq"
  ca-toronto-1      = "ocid1.image.oc1.ca-toronto-1.aaaaaaaaxacqx2sp5patqznirxg5siu3d3e3t6yqeoedqlwbgy5khb5wz7ba"
  eu-amsterdam-1    = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaaod4dkc5kjoyptn7tcrxjmqkceibbfjmbs33kznypwddkf7vbgwyq"
  eu-frankfurt-1    = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa5qza4pumg3tfvwvwdt26dhhmktwbebqcdkgi4zlulrxmuw4vmhiq"
  eu-marseille-1    = "ocid1.image.oc1.eu-marseille-1.aaaaaaaa2v3et6n2jhied3fbzsq7g5pnkbfzn4jgrqaw2einkrs5kmwj3r2q"
  eu-milan-1        = "ocid1.image.oc1.eu-milan-1.aaaaaaaaekwr2vlklbyyynjfdqooavqydx3b7j4rg3opvv6q77pvvfmd7koa"
  eu-stockholm-1    = "ocid1.image.oc1.eu-stockholm-1.aaaaaaaayf2pxibdksbhsm3vq7k6jqk3ilrayyyaqulmflf55k3kd64t6vbq"
  eu-zurich-1       = "ocid1.image.oc1.eu-zurich-1.aaaaaaaam54rdavdw7qanr3yubeucv3rh4cangvat5yfl5fmcnstnpmtk7jq"
  il-jerusalem-1    = "ocid1.image.oc1.il-jerusalem-1.aaaaaaaa6ve5fi2zprb6sr3g2lz6jui6ihkfjzo23cu3ljle2sm7ywyyma2a"
  me-abudhabi-1     = "ocid1.image.oc1.me-abudhabi-1.aaaaaaaag3uw37vs3cp6izpoeqrkxgxghgirek27ga5s5e2wafjsrsqwunxq"
  me-dubai-1        = "ocid1.image.oc1.me-dubai-1.aaaaaaaadt2iytjicjkddtdg7odohhvlfw5w22wnvvbg5qidqvygpdpt2vya"
  me-jeddah-1       = "ocid1.image.oc1.me-jeddah-1.aaaaaaaayhdaxqwgklewebiidxmmgun6m74xetgmltprd6ijeutifyutv7iq"
  sa-santiago-1     = "ocid1.image.oc1.sa-santiago-1.aaaaaaaal2dmgbrhe4mj7ozktvte26r6qr45nta5sdnp5xgfphmhgzdpq2wa"
  sa-saopaulo-1     = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaauw72adaz3i7yoddr3c3jkdehiw3rmummc33pxt7j7wzfygdybhia"
  sa-vinhedo-1      = "ocid1.image.oc1.sa-vinhedo-1.aaaaaaaalshuba7t6zgx43v6roq54n6gss577oh5vflyqisxczucrrnnvwha"
  uk-cardiff-1      = "ocid1.image.oc1.uk-cardiff-1.aaaaaaaa5gb55irdauuuuoqzqqruotligun2umaiky5zpvbtpgz7gzhzft2a"
  uk-london-1       = "ocid1.image.oc1.uk-london-1.aaaaaaaaummuogirswnepvbgzob5pdv73oegkkfzoweb7ioo2vodqei5wtea"
  us-ashburn-1      = "ocid1.image.oc1.iad.aaaaaaaapcf3o54qeigj22nowwdtceyepisigpz3fho67l3xm7lmqkrgb62q"
  us-phoenix-1      = "ocid1.image.oc1.phx.aaaaaaaalz3plgjt37dt3gj7ckwxklmfn7bxe5gittmbxsdxbviefmbbtpaq"
  us-sanjose-1      = "ocid1.image.oc1.us-sanjose-1.aaaaaaaaf7ci5w3zo5zat4jiaxruml72rhumflrbth3atpv5nnbduxeyvjka"  
}
