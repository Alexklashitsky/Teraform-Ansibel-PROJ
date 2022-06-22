# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }

  }

  required_version = ">= 1.1.0"
  # backend "azurerm" {
  #   resource_group_name  = "week6"
  #   storage_account_name = "backendstorage2022"
  #   container_name       = "state"
  #   key                  = "prod.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "week6" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./network"
  base_name           = "week6"
  location            = var.location
  resource_group_name = azurerm_resource_group.week6.name

}

module "db" {
  source              = "./db"
  location            = var.location
  privete_subnet_id   = module.network.privete_subnet_id
  resource_group_name = azurerm_resource_group.week6.name
  vnet_id             = module.network.vnet_id
}

# module "lb" {
#   source              = "./lb"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.week6.name
#   public_ip           = module.network.app_public_ip
#   application_port    = var.application_port
# }
