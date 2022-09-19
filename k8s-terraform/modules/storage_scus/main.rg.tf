# create storage resource group
resource "azurerm_resource_group" "rg_storage" {
  name     = var.rg_storage
  location = var.azure_region
}
