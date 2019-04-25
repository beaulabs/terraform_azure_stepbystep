# Set the cloud provider and version for TF to use
# Reference link: https://github.com/terraform-providers/terraform-provider-azurerm
provider "azurerm" {
  version = "=1.25.0"
}

# This assumes a Virtual Network named `azgbc-beaulabs-vnetwork` exists in the Resource Group `azgbc-beaulabs`.
data "azurerm_virtual_network" "devnetwork" {
  name                = "azgbc-beaulabs-vnetwork"
  resource_group_name = "azgbc-beaulabs"
}

resource "azurerm_subnet" "uatsubnet" {
  name                 = "uatnet1"
  resource_group_name  = "${data.azurerm_virtual_network.devnetwork.resource_group_name}"
  virtual_network_name = "${data.azurerm_virtual_network.devnetwork.name}"
  address_prefix       = "10.0.30.0/24"
}
