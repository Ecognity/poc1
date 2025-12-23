#Provider for terraform
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

module "rg" {
  source   = "./modules/resource_group"
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

module "insecure_nsg" {
  source = "./modules/nsg"

  nsg_name            = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
  tags = {
    environment = "demo"
  }
}
