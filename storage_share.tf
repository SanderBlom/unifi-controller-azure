resource "azurerm_storage_share" "unifi_share" {
  name                 = "unifi_controller"
  storage_account_name = azurerm_storage_account.unifi_sa.name
  quota                = 50
}