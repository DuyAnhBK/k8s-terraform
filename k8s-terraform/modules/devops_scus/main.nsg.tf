# Create a network security group for subnet in devops
resource "azurerm_network_security_group" "nsg_devops" {
  name                = "nsg_devops"
  location            = var.azure_region
  resource_group_name = var.rg_devops

  # allow all inbound
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

# Association devops subnet to devops network security group
resource "azurerm_subnet_network_security_group_association" "devops_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.subnet_devops.id
  network_security_group_id = azurerm_network_security_group.nsg_devops.id
}
