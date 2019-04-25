# Set the cloud provider and version for TF to use
# Reference link: https://github.com/terraform-providers/terraform-provider-azurerm
provider "azurerm" {
  version = "=1.25.0"
}

# Create the resource group to build out our infrastructure into
# Reference link: https://www.terraform.io/docs/providers/azurerm/r/resource_group.html
resource "azurerm_resource_group" "beaulabs_resgrp" {
  name     = "azgbc-beaulabs"
  location = "west us"

  tags = {
    environment = "development"
    owner = "beaulabs-devteam-1"
  }
}
# Create the resource group's virtual network
# Reference link: https://www.terraform.io/docs/providers/azurerm/r/virtual_network.html
resource "azurerm_virtual_network" "beaulabs-vnetwork" {
  name                = "azgbc-beaulabs-vnetwork"
  resource_group_name = "${azurerm_resource_group.beaulabs_resgrp.name}"
  location            = "${azurerm_resource_group.beaulabs_resgrp.location}"
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "development"
    owner = "beaulabs-networkteam"
  }

  subnet {
    name = "devnet1"
    address_prefix = "10.0.10.0/24"
  }

  subnet {
    name = "devnet2"
    address_prefix = "10.0.20.0/24"
  }
}
