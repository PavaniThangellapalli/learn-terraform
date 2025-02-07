provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "example" {
  name = "project-setup"
}
output "rg" {
  value=data.azurerm_resource_group.example
}