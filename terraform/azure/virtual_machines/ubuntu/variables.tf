#------------------------------ location, resource and networks
variable "resource_group_location" {
  type        = string
  default     = "northeurope"
  description = "Resource group location"
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Resource group prefix"
}

# ------------------- Azure ubuntu server--------------------------------
# Standard_B1s cpu:1, memory: 1GB, storage: 5GG SSD # very small fro learning purposes
# Standard_B2s cpu:2, memory: 4GB, storage: 8GG SSD # bigger for develpment
variable "vm_details" {
  type = object({
    name = string
    size = string
    offer = string
    sku      = string
    publisher  = string
    version  = string
    storage_account_type  = string
    account_tier  = string
    account_replication_type  = string
    disk_name  = string
    disk_caching  = string
  })
  default = {
    name                      = "node-ubuntu"
    size                      = "Standard_B1s"
    offer                     = "0001-com-ubuntu-server-jammy"
    sku                       = "22_04-lts-gen2"
    publisher                 = "Canonical"
    version                   = "latest"
    storage_account_type      = "StandardSSD_LRS"
    account_tier              = "Standard"
    account_replication_type  = "LRS"
    disk_name                 = "myOsDisk"
    disk_caching              = "ReadWrite"
  }
}

# ------------------- auth------------------------------
variable "username" {
  type        = string
  description = "user name"
  default     = "youruser_name"
}

variable "publicsshkey" {
  type        = string
  description = "public ssh key local"
  default     = "~/.ssh/id_rsa.pub"
}

# ------------------- networks------------------------------
variable "network_settings" {
  type = object({
    virtual_network_name = string
    public_ip_name = string
    ip_allocation_method = string
    subnet_network_name  = string
    nsg_name = string
    network_interface_name = string
  })
  default = {
    virtual_network_name      = "cluster-vn"
    public_ip_name            = "cluster-ip"
    ip_allocation_method      = "Static"
    subnet_network_name       = "cluster-sn"
    nsg_name                  = "myNetworkSecurityGroup"
    network_interface_name    = "myNIC"
  }
}

variable "network_security_rules" {
  type = list(object({
    name = string
    priority = number
    direction = string
    protocol = string
    destination_port_range = string

  }))
  default = [
    {
      name                       = "SSH"
      priority                   = 1001
      direction                  = "Inbound"
      protocol                   = "Tcp"
      destination_port_range     = "22"
    },
    {
      name                       = "web"
      priority                   = 1011
      direction                  = "Inbound"
      protocol                   = "Tcp"
      destination_port_range     = "80"
    },
    {
      name                       = "ssl"
      priority                   = 1012
      direction                  = "Inbound"
      protocol                   = "Tcp"
      destination_port_range     = "443"
    },
    {
      name                        = "http"
      priority                    = 100
      direction                   = "Outbound"
      protocol                    = "Tcp"
      destination_port_range      = "*"
    }
  ]
}