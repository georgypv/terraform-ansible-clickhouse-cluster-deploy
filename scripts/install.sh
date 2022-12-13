#!/bin/bash
cd ansible
echo "Installing everything with Ansible..."
sleep 10
ansible-playbook playbook.yaml
cd ..