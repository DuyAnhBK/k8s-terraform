# Create an Azure DNS Zone
resource "azurerm_dns_zone" "adnsz" {
  name                = var.adnsz
  resource_group_name = var.rg_services
}

# Create an Azure DNS Zone A Record pointing to Public Ip Address of DevOps
resource "azurerm_dns_a_record" "adnza_devops" {
  name                = "devops"
  zone_name           = azurerm_dns_zone.adnsz.name
  resource_group_name = var.rg_services
  ttl                 = 300
  records             = [var.pip_devops_ip_public]
}
