resource "azurerm_app_configuration" "aac" {
  name                = var.aac
  resource_group_name = var.rg_services
  location            = var.azure_region
}
