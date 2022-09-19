# Create a virtual network within the resource group Services
resource "azurerm_virtual_network" "vnet_services_scus" {
  name                = var.vnet_services
  resource_group_name = var.rg_services
  location            = var.azure_region
  address_space       = var.address_space_services
}
