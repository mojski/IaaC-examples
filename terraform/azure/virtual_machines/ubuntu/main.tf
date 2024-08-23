# create resource group
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.rg.name
  }
  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "my_storage_account" {
  name                     = "diag${random_id.random_id.hex}"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = var.vm_details.account_tier
  account_replication_type = var.vm_details.account_replication_type
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = var.vm_details.name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = var.vm_details.size

  os_disk {
    name                 = var.vm_details.disk_name
    caching              = var.vm_details.disk_caching
    storage_account_type = var.vm_details.storage_account_type
  }

  source_image_reference {
    publisher = var.vm_details.publisher
    offer     = var.vm_details.offer
    sku       = var.vm_details.sku
    version   = var.vm_details.version
  }

  computer_name  = var.vm_details.name
  admin_username = var.username

  admin_ssh_key {
    username   = var.username
    public_key = file(var.publicsshkey)
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
  }
}
