// Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# Network parameters
vcn_params = {
  vcn_mlflow = {
    compartment_name = "my_compartment"
    display_name     = "vcn_mlflow"
    vcn_cidr         = "10.1.0.0/16"
    dns_label        = "mlflow"
  }
}

igw_params = {
  igw_mlflow = {
    display_name = "igw_mlflow"
    vcn_name     = "vcn_mlflow"
  },
}

ngw_params = {}

rt_params = {
  rt_mlflow = {
    display_name = "rt_mlflow"
    vcn_name     = "vcn_mlflow"

    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = true
        igw_name    = "igw_mlflow"
        ngw_name    = null
      },
    ]
  },
  rt_mlflow_private = {
    display_name = "rt_mlflow_private"
    vcn_name     = "vcn_mlflow"

    route_rules = [
    ]
  },
}

sl_params = {
  sl_mlflow = {
    vcn_name     = "vcn_mlflow"
    display_name = "sl_mlflow"

    egress_rules = [
      {
        stateless   = "false"
        protocol    = "all"
        destination = "0.0.0.0/0"
      },
    ]

    ingress_rules = [
      {
        stateless   = "false"
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "22"
            max = "22"
          },
        ]

        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "3000"
            max = "3000"
          },
        ]

        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "1230"
            max = "1250"
          },
        ]

        udp_options = []
      },
    ]
  }
  sl_mlflow_private = {
    vcn_name     = "vcn_mlflow"
    display_name = "sl_mlflow_private"

    egress_rules = [
      {
        stateless   = "false"
        protocol    = "all"
        destination = "0.0.0.0/0"
      },
    ]

    ingress_rules = [
      {
        stateless   = "false"
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "22"
            max = "22"
          },
        ]

        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "3306"
            max = "3306"
          },
        ]

        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "33060"
            max = "33060"
          },
        ]

        udp_options = []
      },
    ]
  }
}

nsg_params = {
  # hurricane1 = {
  #   display_name = "hurricane1"
  #   vcn_name     = "hur1"
  # },
  # hurricane2 = {
  #   display_name = "hurricane2"
  #   vcn_name     = "hur2"
  # }
}

nsg_rules_params = {
  # hurricane1 = {
  #   nsg_name         = "hurricane1"
  #   protocol         = "6"
  #   stateless        = "false"
  #   direction        = "INGRESS"
  #   source           = "11.0.0.0/16"
  #   source_type      = "CIDR_BLOCK"
  #   destination      = null
  #   destination_type = null
  #   tcp_options = [
  #     {
  #       destination_ports = [
  #         {
  #           min = 22
  #           max = 22
  #         }
  #       ],
  #       source_ports = []
  #     }
  #   ]
  #   udp_options = []
  # }
  # hurricane2 = {
  #   nsg_name         = "hurricane2"
  #   protocol         = "17"
  #   stateless        = "false"
  #   direction        = "EGRESS"
  #   destination      = "10.0.0.0/16"
  #   destination_type = "CIDR_BLOCK"
  #   source           = null
  #   source_type      = null
  #   udp_options = [
  #     {
  #       source_ports = [
  #         {
  #           min = 22
  #           max = 22
  #         }
  #       ],
  #       destination_ports = []
  #     }
  #   ]
  #   tcp_options = []
  # }
}

subnet_params = {
  sb_mlflow = {
    display_name      = "sb_mlflow"
    cidr_block        = "10.1.1.0/24"
    dns_label         = "subnet1"
    is_subnet_private = false
    sl_name           = "sl_mlflow"
    rt_name           = "rt_mlflow"
    vcn_name          = "vcn_mlflow"
  },
  sb_mlflow_private = {
    display_name      = "sb_mlflow_private"
    cidr_block        = "10.1.2.0/24"
    dns_label         = "subnet2"
    is_subnet_private = true
    sl_name           = "sl_mlflow_private"
    rt_name           = "rt_mlflow_private"
    vcn_name          = "vcn_mlflow"
  },  
}

lpg_params = {}
drg_params = {}
