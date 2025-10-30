#!/bin/bash

component=$1
sudo dnf install ansible -y
ansible-pull -U https://github.com/lavanya-esw/roboshop_ansible_roles_tf.git -e component=$component main.yaml