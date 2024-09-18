# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.loc
}

resource "azurerm_virtual_network" "myvirtualnetwork" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space

}


variable "loc" {
  type    = string
  default = "westus2"
}

variable "name" {
  type    = string
  default = "myTFResourceGroup"
}

variable "virtual_network_name" {
  type    = string
  default = "myvirtualnetwork"
}

variable "address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]

}
