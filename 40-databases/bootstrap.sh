#!/bin/bash
set -e~
component=$1
environment=$2
sudo dnf install ansible -y
#ansible-pull -U https://github.com/lavanya-esw/roboshop_ansible_roles_tf.git -e component=$component main.yaml
REPO_URL="https://github.com/lavanya-esw/roboshop_ansible_roles_tf.git"
REPO_DIR="/opt/roboshop/ansible"
ANSIBLE_DIR="roboshop_ansible_roles_tf"

LOG_DIR="/var/log/roboshop"
mkdir -p $REPO_DIR
mkdir -p ${LOG_DIR}
cd $LOG_DIR

cd $REPO_DIR
if [ -d $ANSIBLE_DIR ]; then
    cd $ANSIBLE_DIR
    git pull
else
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

ansible-playbook -e "component=$component" -e "env=$environment" main.yaml