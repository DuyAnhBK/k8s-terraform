# create devops resource group
resource "azurerm_resource_group" "rg_devops" {
  name     = var.rg_devops
  location = var.azure_region
}
