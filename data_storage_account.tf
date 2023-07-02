data "azurerm_storage_account" "access_key" {
  name                = azurerm_storage_account.unifi_sa.name
  resource_group_name = data.azurerm_resource_group.deployment
}
