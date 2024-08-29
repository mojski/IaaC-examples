
# README.md

## Table of Contents
1. [Changelog](#changelog)
2. [Consul Installation on Linux Machines using Ansible](#consul-installation-on-linux-machines-using-ansible)
   - [1. Prepare the Inventory File](#1-prepare-the-inventory-file)
   - [2. Install Consul](#2-install-consul)
   - [3. Open Consul Ports](#3-open-consul-ports)
3. [Consul Installation on Windows Machines using PowerShell](#consul-installation-on-windows-machines-using-powershell)
   - [1. Prepare the Installation File](#1-prepare-the-installation-file)
   - [2. Run Installation Scripts](#2-run-installation-scripts)
   - [3. Configure the Service](#3-configure-the-service)
4. [Future Improvements](#future-improvements)

## Changelog
- **08/2024**: Fully working Consul cluster scripts

## Consul Installation on Linux Machines using Ansible

### 1. Prepare the Inventory File
- Select the desired release.
  
  ![Release Selection](/consul/assets/image.png)
  
- Generate a Consul secret key:
   ```bash
   consul keygen
   ```

- Configure the inventory file with the following format:
   ```yaml
   hosts:
      node_1:
        ansible_host: node1_ip
        ansible_ssh_user: user_name
        server_name: node1_name
        consul_retry_join: ["node2_ip", "node3_ip"]
        node_name: apps
        is_server: "true" # Must be a string
        bind_addr: 0.0.0.0

      node_2:
        ansible_host: node2_ip
        ansible_ssh_user: user_name
        server_name: tools
        consul_retry_join: ["node1_ip", "node3_ip"]
        node_name: tools
        is_server: "true"
        bind_addr: 0.0.0.0

      node_3:
        ansible_host: node3_ip
        ansible_ssh_user: user_name
        server_name: tools
        consul_retry_join: ["node1_ip", "node2_ip"]
        node_name: tools
        is_server: "true"
        bind_addr: 0.0.0.0
   ```

### 2. Install Consul
To run the Ansible playbook, you can use WSL on your local PC or any Linux machine.

**Requirements:**
- Ansible installed ([How to install Ansible](https://adamtheautomator.com/install-ansible/))
- Your public SSH key must be added to the remote machines for the user specified in the inventory file.

Navigate to the `consul/_cluster/` directory.

#### a. Test the Connection
Run the `test_connections.yml` playbook to verify the connection:
```bash
ansible-playbook test_connections.yml -i inventory.yml
```

#### b. Run the Consul Installation Playbook
Run the `consul_install_cluster.yml` playbook:
```bash
ansible-playbook consul_install_cluster.yml -i inventory.yml
```
If the installation fails, check the inventory file, comment on the tasks that ran properly, and restart the playbook from the failure point.

### 3. Open Consul Ports
Run the following playbook to open the necessary ports:
```bash
ansible-playbook set_ports.yml -i inventory.yml
```
After this step, you should be able to access the UI at `http://machine_ip:8500`.

## Consul Installation on Windows Machines using PowerShell

### 1. Prepare the Installation File
- Select the release and other parameters in the `install.ps1` file (located in `/consul/windows`).
- Adjust the `consul.json` file with IP addresses and encryption keys following the same pattern as in the Linux inventory.

### 2. Run Installation Scripts
- Connect to the Windows machine's desktop and run `install.ps1`, then open `ports.ps1`.

### 3. Configure the Service
- Open the "Services" app in Windows and start the Consul service.

  ![Services App](/consul/assets/image-1.png)

- Right-click on the service name, and select "Recovery" options. Configure it to restart twice after failure, with a one-minute delay.

  ![Recovery Options](/consul/assets/image-2.png)

- In the "General" tab, set the service to "Automatic" start mode.

## Future Improvements
It is possible that in the future, the process of adding Consul to Windows machines will be more automated.
