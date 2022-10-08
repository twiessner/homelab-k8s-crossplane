
terraform {
  required_version = ">= 1.3"

  backend "azurerm" {
    resource_group_name  = "rg-homelab-mgnt-westeu"
    storage_account_name = "sthomelabtfbackend001"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}