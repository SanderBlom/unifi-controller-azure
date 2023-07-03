resource "azurerm_log_analytics_workspace" "unifi_logs" {
  name                = "la-${var.project_name}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.deployment.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}