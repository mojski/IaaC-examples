## Changelog
- 02/2024 initial: Ansible workshop resources for beginners
- 14/04/2024 adding a terraform script for creating debian vm for programming and basics of ansible scripts
- 16/04/2024 Terraform script refactor and script for ubuntu 22.04

## Terraform and Ansible

Both tools are simillar, but mostly are used combined:
- terraform for provisioing infrastructure

![alt text](/assets/terr.png)

- ansible for configuration

![alt text](/assets/ans.png)


Create infrastructure with scripts ant tools like ansible and terrafor ensures repeatability, documentation and convenience of creating infrastructure. It is known as Ifrastructure as Code. 

[Read more about IaC here](https://aws.amazon.com/what-is/iac/)

[and here](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac)

# Initial setup
1. Install terraform 
```shell
winget install --id=Hashicorp.Terraform  -e
```
2. Select azure subscription
```shell
az account set --subscription "<subscription ID or name>"
```
3. Set token
```shell
az account get-access-token # it will prompt to azure auth screen in browser, after success it will set token in your shell
```
or select with specific subscription
```shell
az account get-access-token --subscription "<subscription ID or name>"
```

## How to use
1. Select the machine to create, copy the terraform/create_azure_foldername folder to a separate directory
2. Customize the variables.tf file: VM name, user, ssh key path and so on
3. Open any console in the folder and type the commands:
```shell
terraform init
#then:
terraform plan -out main.tfplan
```
it will create and display the main.tfplan file, and all steps will be performed when creating the machine.
4. If everything looks good, you can apply the plan with the command:
```shell
terraform apply "main.tfplan"
```
5. Console will display ip fo new machine:
![alt text](/assets/image.png)

ou can check this by connecting to the user retrieved from variables.tf using an ssh connection. You should connect without a password and have root privileges.

> [!CAUTION]
> do not edit files from the current folder, this may cause problems with the destruction of the created resources.

6. When you want to delete everything just plan destroy and apply it:
```shell
terraform plan -destroy -out main.destroy.tfplan # it could take few seconds
```
![alt text](/assets/image-1.png)

```shell
terraform apply "main.destroy.tfplan"
```

# Using ansible
Before you remove the machine, you can customize it with Ansible scripts, e.g. install Docker or Nginx.

To run Ansible, you need a Linux computer. You can use Windows Subsystem for Linux and access your home folder from Windows File Explorer.

```
\\wsl.localhost\Ubuntu\home # paths may vary
```
You can also use any Linux machine (e.g. raspberry pi, other virtual machine).
Paste the usable_playbooks folder in your chosen location.
In the Linux terminal, navigate to the usable_playbooks folder.

1. Add ip or alias of machine you want to change to inventory file:
```ini
[servers]
<<ip_or_alias>> ansible_ssh_user=<<user_name>>
<<another_ip_or_alias>>
[servers:vars]
key="value" # just template
```

2. run any playbook you want by command:
```shell
ansible-playbook <<playbook_name.yml>> -i inventory
```
> [!CAUTION]
> Playbooks are written for Debian 11. They probably won't work on other distributions.

## Useful links

[winget instructions](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=winget)

[Azure Auth with cli](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli)

[Azure vm images](https://az-vm-image.info/)

[Azure Gen 2 vm sizes](https://learn.microsoft.com/en-us/azure/virtual-machines/generation-2)

