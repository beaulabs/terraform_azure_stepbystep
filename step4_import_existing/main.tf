# Remember - these resources must exist in Azure first when using the `terraform import` command

resource "azurerm_resource_group" "beaulabsrg" {
  name     = "${var.prefix}-test"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "beaulabsvn" {
  name                = "${var.prefix}-test-vnet"
  location            = "${var.location}"
  resource_group_name = "${var.prefix}-test"

  address_space = ["172.17.0.0/16"]

  # Once imported you can show normal workflow would apply after import
  # by uncommenting the tags code below and running `terraform plan/apply`  

  #   tags {
  #     environment = "staging"
  #   }
}

resource "azurerm_subnet" "beaulabssubnet" {
  name                 = "${var.prefix}-test-subnet"
  resource_group_name  = "${azurerm_resource_group.beaulabsrg.name}"
  virtual_network_name = "${azurerm_virtual_network.beaulabsvn.name}"

  address_prefix = "172.17.16.0/24"
}
