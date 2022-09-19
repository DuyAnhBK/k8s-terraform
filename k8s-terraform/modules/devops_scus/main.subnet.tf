# Create a subnet for services inside the virtual network DevOps
resource "azurerm_subnet" "subnet_devops" {
  name                 = "subnet_devops"
  resource_group_name  = var.rg_devops
  virtual_network_name = var.vnet_devops
  address_prefixes     = var.address_prefixes_devops
}
