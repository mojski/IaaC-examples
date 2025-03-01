# Create an Azure Kubernetes Service

## Requirements

- Azure account
- Terraform installed
- Azure CLI installed (`az cli`)
- Public and private SSH key

### 1. Adjust the `variables.tf` file

- Adjust VM sizes and the number of instances to your requirements (by default, two small and cheap VMs are used).

### 2. Log in to your Azure account

Run:

```bash
az login
```

Then follow the login process.

### 3. Run Terraform scripts

Initialize Terraform:

```bash
terraform init
```

Plan the deployment:

```bash
terraform plan -out main.tfplan
```

If everything looks good, apply the plan:

```bash
terraform apply "main.tfplan"
```

Wait a few minutes. All secrets and outputs will be written in `terraform.tfstate`.

Copy the **resource group** and **cluster name** (default is `"my-cluster"`), then get credentials:

```bash
az aks get-credentials --resource-group "your_resource_group" --name "my-cluster"
```

This will write the credentials to `~/.kube/config`.

Check available contexts:

```bash
kubectl config get-contexts
```

> ⚠️ **Warning:** Do not delete Terraform-generated files. These files are required to properly destroy the cluster later.

### 4. Destroy everything

One of Terraform's biggest advantages is that you can delete everything with just a few commands.

First, generate a destruction plan:

```bash
terraform plan -destroy -out main.destroy.tfplan
```

Then apply it:

```bash
terraform apply "main.destroy.tfplan"
```

Remove context for deleted cluster:

```bash
kubectl config delete-context my-cluster
```

Voilà! 🎉