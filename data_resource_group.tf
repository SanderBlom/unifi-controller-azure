# A reference to the resource group created by the backend module
data "azurerm_resource_group" "deployment" {
  name = var.deployment_resource_group_name
}

