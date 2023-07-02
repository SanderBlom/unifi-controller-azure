resource "azurerm_storage_account" "unifi_sa" {
  name                     = "sa${var.project_name}${local.environment_name}"
  resource_group_name      = data.azurerm_resource_group.deployment.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
