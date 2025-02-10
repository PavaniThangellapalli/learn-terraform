terraform {
  backend "azurerm" {
    resource_group_name  = "project-setup"
    storage_account_name = "pavanitfstates"
    container_name       = "tfstates"
    key                  = "example.tfstate"
  }
}
output "test" {
  value = "hello"
}