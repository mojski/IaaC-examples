# ------------------- Azure ubuntu server--------------------------------

# ------------------- user and machine name------------------------------
variable "computer_name" {
  type        = string
  description = "computer_name"
  default     = "mojski-vm-ub"
}

variable "username" {
  type        = string
  description = "user name"
  default     = "mojski"
}

variable "publicsshkey" {
  type        = string
  description = "public ssh key local"
  default     = "~/.ssh/id_rsa.pub"
}

# -------------------------- vm settings------------------------------------- 
variable "offer" {
  type        = string
  description = "image for virtual machine"
  default     = "0001-com-ubuntu-server-jammy"
}
variable "vmsize" {
  type        = string
  description = "Vm size"
  default     = "Standard_B2s"
}

# Standard_B1s cpu:1, memory: 1GB, storage: 5GG SSD # very small fro learning purposes
# Standard_B2s cpu:2, memory: 4GB, storage: 8GG SSD # bigger for develpment

variable "sku" {
  type        = string
  description = "Stock Keeping Unit SKUs are used to define the characteristics and capabilities of different Azure resources and services"
  default     = "22_04-lts-gen2"
}

variable "publisher" {
  type        = string
  description = "image publisher"
  default     = "Canonical"
}

variable "machineversion" {
  type        = string
  description = "image version"
  default     = "latest"
}

# ---- vm settings: disk

variable "storage_account_type" {
  type        = string
  description = " disk storageaccount type"
  default     = "StandardSSD_LRS"
}

variable "account_tier" {
  type        = string
  description = " disk storageaccount tier"
  default     = "Standard"
}

#expected account_replication_type to be one of [LRS ZRS GRS RAGRS GZRS RAGZRS]
variable "account_replication_type" {
  type        = string
  description = "disk storageaccount tier"
  default     = "LRS"
}

variable "disk_name" {
  type        = string
  description = "disk name"
  default     = "myOsDisk"
}

variable "disk_caching" {
  type        = string
  description = ""
  default     = "ReadWrite"
}

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
