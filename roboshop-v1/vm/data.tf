data "azurerm_resource_group" "rg" {
  name = "project-setup"
}
data "azurerm_network_security_group" "nsg" {
  name                = "allow-all"
  resource_group_name = data.azurerm_resource_group.rg.name
}
data "azurerm_subnet" "subnet" {
  name                 = "default"
  virtual_network_name = "project-network"
  resource_group_name  = data.azurerm_resource_group.rg.name
}
