# Set the cloud provider and version for TF to use
# Reference link: https://github.com/terraform-providers/terraform-provider-azurerm
provider "azurerm" {
  version = "=1.25.0"
}

# This assumes a Virtual Network named "beaulabs-azgbc-vnetwork` exists in the Resource Group "beaulabs-azgbc`.
data "azurerm_virtual_network" "devnetwork" {
  name                = "beaulabs-azgbc-vnetwork"
  resource_group_name = "beaulabs-azgbc"
}

resource "azurerm_subnet" "uatsubnet" {
  name                 = "uatnet1"
  resource_group_name  = "${data.azurerm_virtual_network.devnetwork.resource_group_name}"
  virtual_network_name = "${data.azurerm_virtual_network.devnetwork.name}"
  address_prefix       = "10.0.30.0/24"
}
