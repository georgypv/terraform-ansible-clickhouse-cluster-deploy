
1. Set up cloud infrastructure (VMS + Network) and create `inventory.yaml` file for Ansible by running:
    ```bash prepare_infra.sh```
2. Go to ./ansible directory and run `ansible-playbook playbook.yaml` to install and configure a ClickHouse cluster with coordination via Zookeeper.
3. Connect via ssh to any node with clickhouse installed (IPs can be found in the inventory.yaml file) and check the cluster configuration. 
First, run `clickhouse-client` to get access to the Clickhouse CLI. Then, make the following query:
    ```SELECT * FROM system.clusters```
In result, you should find information about the cluster: 2 shards with 2 replicas each (=4 nodes in total)