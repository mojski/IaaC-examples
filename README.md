
## Changelog
- **02/2024**: Initial: Ansible workshop resources for beginners.
- **14/04/2024**: Added a Terraform script for creating Debian VM for programming and basics of Ansible scripts.
- **16/04/2024**: Refactored Terraform script and added support for Ubuntu 22.04.
- **29/06/2024**: Added monitoring with Grafana, Prometheus, and Node Exporter playbooks; added SEQ `docker-compose.yml`.
- **08/2024**: More Grafana integrations via Prometheus exporter, all-in-one Jaeger instance, Terraform script for creating Cosmos DB free instance, Ansible playbooks for MariaDB, MSSQL, Elasticsearch, and MongoDB.
- **19/08/2024**: Consul installation and Terraform VMs refactoring.
- **03/2025**: Add ansible lint to github pipline with refactor ansible playbooks


## Terraform and Ansible

Both tools are similar but are often used in combination:
- Terraform for provisioning infrastructure.

  ![Terraform](/docs/terr.png)

- Ansible for configuration.

  ![Ansible](/docs/ans.png)

Creating infrastructure with tools like Ansible and Terraform ensures repeatability, documentation, and convenience. This approach is known as Infrastructure as Code (IaC).

[Read more about IaC here](https://aws.amazon.com/what-is/iac/)

[and here](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac)

## Initial Setup
1. **Install Terraform:**
   ```shell
   winget install --id=Hashicorp.Terraform -e
   ```

2. **Select Azure Subscription:**
   ```shell
   az account set --subscription "<subscription ID or name>"
   ```

3. **Set Token:**
   ```shell
   az account get-access-token # Prompts Azure auth screen in browser; sets token in your shell upon success.
   ```
   Or, specify a subscription:
   ```shell
   az account get-access-token --subscription "<subscription ID or name>"
   ```

## How to Use
1. Select the machine to create, and copy the `terraform/create_azure_foldername` folder to a separate directory.
2. Customize the `variables.tf` file (e.g., VM name, user, SSH key path).
3. Open a terminal in the folder and run:
   ```shell
   terraform init
   terraform plan -out main.tfplan
   ```
   This creates and displays the `main.tfplan` file, showing all steps for creating the machine.

4. If everything looks correct, apply the plan:
   ```shell
   terraform apply "main.tfplan"
   ```

5. The console will display the IP of the new machine:

   ![New Machine IP](/docs/image.png)

   Connect to the user retrieved from `variables.tf` using an SSH connection. You should connect without a password and have root privileges.

   > **Caution:** Do not edit files in the current folder; this may cause issues with destroying the created resources.

6. To delete everything, plan the destruction and apply:
   ```shell
   terraform plan -destroy -out main.destroy.tfplan # May take a few seconds
   terraform apply "main.destroy.tfplan"
   ```

   ![Destroy Plan](/docs/image-1.png)

## Using Ansible
Before removing the machine, you can customize it with Ansible scripts (e.g., install Docker or Nginx).

To run Ansible, you need a Linux environment. You can use Windows Subsystem for Linux (WSL) and access your home folder via Windows File Explorer.

```
\\wsl.localhost\Ubuntu\home # Paths may vary
```
Alternatively, use any Linux machine (e.g., Raspberry Pi, another virtual machine).

Copy the `usable_playbooks` folder to your chosen location. In the Linux terminal, navigate to the `usable_playbooks` folder.

1. Add the IP or alias of the machine you want to change to the inventory file:
   ```ini
   [servers]
   <<ip_or_alias>> ansible_ssh_user=<<user_name>>
   <<another_ip_or_alias>>
   [servers:vars]
   key="value" # Example template
   ```

2. Run any playbook using the command:
   ```shell
   ansible-playbook <<playbook_name.yml>> -i inventory
   ```

   > **Caution:** Playbooks are written for Ubuntu 20.04. They may work on other distributions with minor adjustments.

## Useful Links

- [Winget Instructions](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=winget)
- [Azure CLI Authentication](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli)
- [Azure VM Images](https://az-vm-image.info/)
- [Azure Gen 2 VM Sizes](https://learn.microsoft.com/en-us/azure/virtual-machines/generation-2)
