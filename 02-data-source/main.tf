provider "azurerm" {
  features {}
  subscription_id = "ef791f67-7558-4920-ba6c-72951b295947"
}
data "azurerm_resource_group" "example" {
  name = "project-setup"
}
output "rg" {
  value=data.azurerm_resource_group.example
}