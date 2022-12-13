#!/bin/bash
cd terraform || exit 1
terraform validate || (echo "Terraform config is invalid!" && exit 1)
echo "Validated terraform configuration"

terraform apply --var-file=secret.tfvars --auto-approve
echo "Created cloud infrastructure"

node1_ip=$(terraform output -raw external_ip_node1)
node2_ip=$(terraform output -raw external_ip_node2)
node3_ip=$(terraform output -raw external_ip_node3)
node4_ip=$(terraform output -raw external_ip_node4)
node5_ip=$(terraform output -raw external_ip_node5)

int_node1_ip=$(terraform output -raw internal_ip_node1)
int_node2_ip=$(terraform output -raw internal_ip_node2)
int_node3_ip=$(terraform output -raw internal_ip_node3)
int_node4_ip=$(terraform output -raw internal_ip_node4)
int_node5_ip=$(terraform output -raw internal_ip_node5)

cd ..
cat << EOF > ansible/inventory.yaml
click:
  hosts:
    ch01-shard01-replica01:
      ansible_host: $node1_ip
    ch01-shard02-replica01:
      ansible_host: $node2_ip
    ch01-shard01-replica02:
      ansible_host: $node3_ip
    ch01-shard02-replica02:
      ansible_host: $node4_ip

zookeeper:
  hosts:
    zoo_node:
      ansible_host: $node5_ip
EOF
echo "Got hosts for Ansible inventory"

cat << EOF > ansible/group_vars/all
ip_node1: $node1_ip
ip_node2: $node2_ip
ip_node3: $node3_ip
ip_node4: $node4_ip
ip_node5: $node5_ip

int_ip_node1: $int_node1_ip
int_ip_node2: $int_node2_ip
int_ip_node3: $int_node3_ip
int_ip_node4: $int_node4_ip
int_ip_node5: $int_node5_ip
EOF
echo "Got hosts for Ansible group_vars"
