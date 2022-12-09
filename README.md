The present repository contains scripts that allow to create a ClickHouse cluster (2 shards with 2 replicas each) on Yandex Cloud infrastructure.

The repository contains scripts which set up a cluster of 4 virtual machines with help of Terraform ( in `./terraform`) and 2 Ansible roles - one for Zookeeper and the other for ClickHouse - 
in `./ansible`.

##### Instructions:
1. Set up cloud infrastructure (VMS + Network) and create `inventory.yaml` file for Ansible by running:
    ```bash prepare_infra.sh```
2. Go to ./ansible directory and run `ansible-playbook playbook.yaml` to install and configure a ClickHouse cluster with coordination via Zookeeper.
3. Connect via ssh to any node with clickhouse installed (IPs can be found in the created inventory.yaml file) and check the cluster configuration. 
First, run `clickhouse-client` to get access to the Clickhouse CLI. Then, make the following query:
    ```SELECT * FROM system.clusters```
In result, you should find information about the cluster: 2 shards with 2 replicas each (=4 nodes in total)
