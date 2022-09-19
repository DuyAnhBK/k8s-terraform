# Create a network security group for subnet in services
resource "azurerm_network_security_group" "nsg_services" {
  name                = "nsg_services"
  location            = var.azure_region
  resource_group_name = var.rg_services

  # 
  security_rule {
    access                     = "Allow"
    description                = "Inbound"
    destination_address_prefix = "*"
    # destination_address_prefixes = [ "value" ]
    # destination_application_security_group_ids = [ "value" ]
    destination_port_range = "*"
    # destination_port_ranges = [ "value" ]
    direction             = "Inbound"
    name                  = "Internet"
    priority              = 100
    protocol              = "Tcp"
    source_address_prefix = "*"
    # source_address_prefixes = [ "value" ]
    # source_application_security_group_ids = [ "value" ]
    source_port_range = "*"
    # source_port_ranges = [ "value" ]
  }
}

# Association services subnet to services network security group
resource "azurerm_subnet_network_security_group_association" "services_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.subnet_services.id
  network_security_group_id = azurerm_network_security_group.nsg_services.id
}
