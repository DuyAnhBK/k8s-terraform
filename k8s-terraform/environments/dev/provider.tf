#Import Azure Resources Manager provider and Azure Active Directory provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.77.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "=2.6.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {

}

data "azurerm_client_config" "current" {
}
