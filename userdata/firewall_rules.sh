#!/bin/bash

# Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# Add firewall rules for VMs
case "$1" in
"dev")
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
sudo firewall-cmd --zone=public --add-port=33060/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8888/tcp --permanent
sudo firewall-cmd --reload
;;
"tracking")
sudo firewall-cmd --zone=public --add-port=5000/tcp --permanent
sudo firewall-cmd --reload
;;
"training")
echo "training server - no rules to add"
;;
"serving")
sudo firewall-cmd --zone=public --add-port=1234/tcp --permanent
sudo firewall-cmd --reload
;;
*)
echo "Unknown server type provided"
;;
esac
#sudo systemctl stop firewalld
