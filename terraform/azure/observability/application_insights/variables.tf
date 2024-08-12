#------------------------------ basic settings
variable "retention_days" {
  type        = number
  description = "delete metrics older than x days"
  default     = 30
  # possible values: 30, 60, 90 ... 730
}

ariable "applicarion_insights_sku" {
  type        = string
  description = "sku"
  default     = "PerGB2018"
}

variable "location" {
  type        = string
  default     = "northeurope"
  description = "Resource group location"
}

variable "application_type" {
  type        = string
  default     = "web"
  description = "type of application you want to monitor"
  # se other types: 
  # web -> ASP.NET.
  # ios, java, MobileCenter, NODE.js and more...
  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights#application_type
}
