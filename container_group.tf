resource "azurerm_container_group" "unifi" {
  name                = var.project_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.deployment.name
  ip_address_type     = "Private"
  subnet_ids          = [data.azurerm_subnet.unifi_subnet.id]
  os_type             = "Linux"



  container {
    name   = "unifi-controller"
    image  = "registry.hub.docker.com/linuxserver/unifi-controller:latest"
    cpu    = 1
    memory = 2

    ports {
      port     = 3478
      protocol = "UDP"
    }

    ports {
      port     = 10001
      protocol = "UDP"
    }

    ports {
      port     = 8080
      protocol = "TCP"
    }

    ports {
      port     = 8443
      protocol = "TCP"
    }

    ports {
      port     = 8880
      protocol = "TCP"
    }

    volume {
      name                 = "unifistorage"
      mount_path           = "/config"
      storage_account_name = azurerm_storage_account.unifi_sa.name
      share_name           = azurerm_storage_share.unifi_share.name
      storage_account_key  = data.azurerm_storage_account.access_key.primary_access_key
    }
  }

  diagnostics {
    log_analytics {
      log_type      = "ContainerInstanceLogs"
      workspace_id  = data.azurerm_log_analytics_workspace.unifi_logs.workspace_id
      workspace_key = data.azurerm_log_analytics_workspace.unifi_logs.primary_shared_key
    }
  }

}
