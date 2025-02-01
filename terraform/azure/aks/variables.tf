# -------------- names ------------------

variable "resource_group_location" {
  type        = string
  default     = "polandcentral"
  description = "Location is important"
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "kube"
  description = "Your favourite prefix."
}

variable "cluster_name" {
  type        = string
  default     = "my-cluster"
  description = "Your favourite prefix."
}

variable "dns_prefix" {
  type        = string
  default     = "dns"
  description = "Your favourite dns prefix."
}

# -------------- node pool ------------------
variable "default_node_pool" {
  type = object({
    name = string
    vm_size = string
    node_count = number
  })
  default = {
    name = "agentpool"
    vm_size = "Standard_B2s"
    node_count = 2
  }
}
# -------------------vm sizes--------------------------------
# Standard_B2s      cpu:2    memory: 4GB     storage: 8GG SSD   # tinny node for learning       36 e/month
# Standard_D2_v2    cpu:2    memory: 7GB   storage: 100GB                                      102 e/month
# Standard_D4ds_v5  cpu:4    memory: 16GB   storage: 100GB  #azure portal default option:)     375 e/month

variable "network" {
  type = object({
    network_plugin = string
    load_balancer_sku = string
  })
  default = {
    network_plugin      = "kubenet"
    load_balancer_sku   = "standard"
  }
}

variable "identity_type" {
  type        = string
  description = "Identity type"
  default     = "SystemAssigned"
}
