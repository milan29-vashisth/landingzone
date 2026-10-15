terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg-milan"
    storage_account_name = "milanhsstate2026"
    container_name       = "tfstate"
    key                  = "hub-spoke-dev.tfstate"

    use_azuread_auth = true
  }
}
