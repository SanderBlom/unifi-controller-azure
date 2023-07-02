resource "azurerm_container_group" "example" {
  name                = "${var.project_name}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.deployment.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"

  container {
    name   = "hello-world"
    image  = "registry.hub.docker.com/linuxserver/unifi-controller:latest"
    cpu    = 1
    memory = 2

    # Used for DNS. This is required for Guest Portal redirection, downloading updates, and remote access.
    ports {
      port     = 53
      protocol = "TCP"
    }

    # Used for DNS. This is required for Guest Portal redirection, downloading updates, and remote access.
    ports {
      port     = 53
      protocol = "UDP"
    }

    # Used for STUN.
    ports {
      port     = 3478
      protocol = "UDP"
    }

    # Used for remote syslog capture.
    ports {
      port     = 5514
      protocol = "UDP"
    }

    # Used for device and application communication.
    ports {
      port     = 8080
      protocol = "TCP"
    }

    # Used for application GUI/API as seen in a web browser.
    ports {
      port     = 443
      protocol = "TCP"
    }

    # Used for application GUI/API as seen in a web browser.
    ports {
      port     = 8443
      protocol = "TCP"
    }

    # Used for HTTP portal redirection.
    ports {
      port     = 8880
      protocol = "TCP"
    }

    # Used for HTTPS portal redirection.
    ports {
      port     = 8843
      protocol = "TCP"
    }

    # Used for UniFi mobile speed test.
    ports {
      port     = 6789
      protocol = "TCP"
    }

    # Used for local-bound database communication.
    ports {
      port     = 27117
      protocol = "TCP"
    }

    # Used for device discovery.
    ports {
      port     = 10001
      protocol = "UDP"
    }

    # Used to "Make application discoverable on L2 network" in the UniFi Network settings.
    ports {
      port     = 1900
      protocol = "UDP"
    }

    # Used for NTP (date and time). Required for establishing secure communication with remote access servers.
    ports {
      port     = 123
      protocol = "UDP"
    }

    volume {
      name         = "unifi_storage"
      mount_path = "/config"
      storage_account_name = azurerm_storage_account.unifi_sa.name
      share_name = azurerm_storage_share.unifi_share.name
      storage_account_key = data.azurerm_storage_account.access_key.primary_access_key
    }
  }
}
