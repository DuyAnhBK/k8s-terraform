# Create an Azure AD application
data "azuread_client_config" "current" {}

resource "azuread_application" "aadapp" {
  display_name = var.aadapp
  owners       = [data.azuread_client_config.current.object_id]
}

# Create an Azure AD Service Principal (Managed Identity)
resource "azuread_service_principal" "aadsp" {
  application_id               = azuread_application.aadapp.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

#tfsec:ignore:general-secrets-sensitive-in-attribute
resource "azuread_service_principal_password" "aadsps" {
  service_principal_id = azuread_service_principal.aadsp.id

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

# Network contributor role added to the ServicePrincipal
resource "azurerm_role_assignment" "NetworkContributorRole" {
  scope                = azurerm_virtual_network.vnet_services_scus.id
  principal_id         = azuread_service_principal.aadsp.id
  role_definition_name = "Network Contributor"
}

# Reader Role added to the service principal
resource "azurerm_role_assignment" "ReaderRole" {
  scope                = var.acr_id
  principal_id         = azuread_service_principal.aadsp.id
  role_definition_name = "Reader"
}
