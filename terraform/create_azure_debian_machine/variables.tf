#------------------------------ user and machine name
variable "computer_name" {
  type        = string
  description = "computer_name"
  default     = "mojskiVM"
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

# -------------------------- vm settings
variable "offer" {
  type        = string
  description = "image for virtual machine"
  default     = "debian-11"
}
variable "vmsize" {
  type        = string
  description = "Vm size"
  default     = "Standard_B2als_v2"
}

variable "sku" {
  type        = string
  description = "Stock Keeping Unit SKUs are used to define the characteristics and capabilities of different Azure resources and services"
  default     = "11-backports-gen2"
}

variable "publisher" {
  type        = string
  description = "image publisher"
  default     = "Debian"
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

#------------------------------ resource and networks
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