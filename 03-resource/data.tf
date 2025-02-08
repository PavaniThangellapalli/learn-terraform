data "azurerm_resource_group" "example" {
  name = "project-setup"
}
data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "project-network"
  resource_group_name  = data.azurerm_resource_group.example.name
}
