resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_container_group" "container" {
  name                = var.container_group_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  os_type             = "Linux"
  restart_policy      = var.restart_policy
  dns_name_label      = var.dns_name_label

  container {
    name   = var.container_name
    image  = var.image
    cpu    = var.cpu_cores
    memory = var.memory_in_gb

    ports {
      port     = var.port
      protocol = "TCP"
    }

    environment_variables = {
      "PDF_MAX_SIZE_MB"             = var.pdf_max_size_mb
      "REQUEST_TIMEOUT_SECONDS"     = var.request_timeout_seconds
      "ALLOWED_ORIGINS"             = var.allowed_origins
      "ENVIRONMENT"                 = var.api_environment
      "HTTP_PORTS"                  = var.port
    }

    secure_environment_variables = {
      "IronSecureDoc_LicenseKey"    = var.license_key
    }
  }
}