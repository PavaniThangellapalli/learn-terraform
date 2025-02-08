data "azurerm_resource_group" "example" {
  name = "project-setup"
}
data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "project-setup-network"
  resource_group_name  = data.azurerm_resource_group.example.name
}
