resource "azurerm_storage_share" "unifi_share" {
  name                 = var.project_name
  storage_account_name = azurerm_storage_account.unifi_sa.name
  quota                = 50
}