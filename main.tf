provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.36.0"

  subscription_id = "2a579ce9-e787-4a87-bc31-da8a7ac529f6"
  client_id       = "72e0d2ef-b084-49d2-97a5-d5c566d4f2ae"
  client_secret   = "${var.client_secret}"
  tenant_id       = "2998bf45-9979-4820-aa1e-0e631462e528"
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "example" {
  name                = "${var.prefix}-network"
  resource_group_name = "${azurerm_resource_group.example.name}"
  location            = "${azurerm_resource_group.example.location}"
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  resource_group_name  = "${azurerm_resource_group.example.name}"
  address_prefix       = "10.1.1.0/24"
}