locals {
  docker_bridge_cidr = "192.168.99.100/24"
  service_cidr       = "10.1.0.0/16"
  dns_service_ip     = "10.1.0.10"
  pod_cidr           = "10.10.0.0/16"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks
  location            = var.azure_region
  resource_group_name = var.rg_services
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.aks_version

  linux_profile {
    admin_username = "anhhd"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  default_node_pool {
    name       = "agentpool"
    node_count = var.aks_agent_count
    vm_size    = "Standard_B2s"
  }

  service_principal {
    client_id     = azuread_service_principal.aadsp.application_id
    client_secret = azuread_service_principal_password.aadsps.value
  }

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  network_profile {
    load_balancer_sku  = "standard"
    network_plugin     = "kubenet"
    dns_service_ip     = local.dns_service_ip
    service_cidr       = local.service_cidr
    docker_bridge_cidr = local.docker_bridge_cidr
    pod_cidr           = local.pod_cidr
  }
}
