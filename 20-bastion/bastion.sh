#!/bin/bash
exec > /var/log/user-data.log 2>&1
set -x

# growing the /home volume for terraform purpose
growpart /dev/nvme0n1 4
lvextend -L +30G /dev/mapper/RootVG-homeVol 
xfs_growfs /home
echo "Starting user data script..."

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform

echo "Terraform installed successfully."


