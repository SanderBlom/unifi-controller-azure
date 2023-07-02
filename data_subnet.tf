# A reference to the vnet's subnet created with clickops
data "azurerm_subnet" "unifi_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_RG
}
