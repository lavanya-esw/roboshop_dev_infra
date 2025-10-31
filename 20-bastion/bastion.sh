#!/bin/bash
exec > /var/log/user-data.log 2>&1
set -x

echo "Starting user data script..."

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform

echo "Terraform installed successfully."
