resource "azurerm_resource_group" "application_insights" {
  name     = "tf-test"
  location = "West Europe"
}

resource "azurerm_log_analytics_workspace" "application_insights" {
  name                = "application-insights-workspace"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = var.applicarion_insights_sku
  retention_in_days   = var.retention_days
}

resource "azurerm_application_insights" "application_insights" {
  name                = "tf-test-appinsights"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  workspace_id        = azurerm_log_analytics_workspace.example.id
  application_type    = var.application_type
}

output "instrumentation_key" {
  value = azurerm_application_insights.example.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.example.app_id
}

#terraform import azurerm_application_insights.instance1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Insights/components/instance1