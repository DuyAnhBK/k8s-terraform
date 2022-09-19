# create data resource group
resource "azurerm_resource_group" "rg_data" {
  name     = var.rg_data
  location = var.azure_region
}
