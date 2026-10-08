resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_service_plan" "asp" {
  name                = "ASP-rgloginappdev-9703"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = var.app_service_sku

  tags = azurerm_resource_group.rg.tags
}

resource "azurerm_linux_web_app" "app" {
  name                = "${var.project_name}-2026"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on  = false
    ftps_state = "FtpsOnly"

    application_stack {
      java_server         = "JAVA"
      java_server_version = "11"
      java_version        = "11"
    }
  }

  app_settings = {
    "PORT" = "8080"
  }

  tags = azurerm_resource_group.rg.tags
}
