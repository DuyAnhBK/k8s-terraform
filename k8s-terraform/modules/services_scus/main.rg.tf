# create services resource group
resource "azurerm_resource_group" "rg_services" {
  name     = var.rg_services
  location = var.azure_region
}
