# Create an Azure Load Balancer for Devops
resource "azurerm_lb" "alb_devops" {
  name                = "alb_devops"
  location            = var.azure_region
  resource_group_name = var.rg_devops
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "alb_devops_pip"
    public_ip_address_id = azurerm_public_ip.pip_devops.id
  }
}

# # Create an Azure Load Balancer BackEnd Address Pool for DevOps
# resource "azurerm_lb_backend_address_pool" "albbap_devops" {
#   name            = "alb_devops_bap"
#   loadbalancer_id = azurerm_lb.alb_devops.id
# }

# # Create an Azure Load Balancer BackEnd Address Pool Address for DevOps
# resource "azurerm_lb_backend_address_pool_address" "albbapa_devops" {
#   name                    = "alb_devops_bapa"
#   backend_address_pool_id = azurerm_lb_backend_address_pool.albbap_devops.id
#   virtual_network_id      = azurerm_virtual_network.vnet_devops_scus.id
#   ip_address              = "10.1.0.1"
# }
