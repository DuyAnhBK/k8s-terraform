# Create an Azure Scale Set for devops
resource "azurerm_linux_virtual_machine_scale_set" "ass_devops" {
  name                 = "ass_devops"
  resource_group_name  = var.rg_devops
  location             = var.azure_region
  sku                  = "Standard_DS2_V2"
  instances            = 1
  admin_username       = "anhhd"
  computer_name_prefix = "anhhd-prefix"

  admin_ssh_key {
    username   = "anhhd"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "nic_devops"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.subnet_devops.id
    }
  }
}
