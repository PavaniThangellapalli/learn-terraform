# String Datatype in Terraform. It require only double quotes and Terraform doesn’t support single quotes.
variable "s1" {
  default = "Hello"
}
# Number Datatype in Terraform
variable "n1" {
  default = 2
}
# Boolean Datatype in Terraform
variable "b1" {
  default = true
}
# Plain Variable
variable "v1" {
  default = "Hello"
}
# List Variable
variable "v2" {
  default = [
             "Hello",
              5,
              false
  ]
}
# Map Variable
variable "v3" {
  default = {
    couse = "devops"
    cloud = "azure"
  }
}
# Accessing Plain Variable
output "Output1" {
  value = var.v1
}
# Accessing Plain Variable with a combination of string
output "Output2" {
  value = "${var.v1} John"
}
# Accessing List Variable
output "Output3" {
  value = var.v2[1]
}
# Accessing Map Variable
output "Output4" {
  value = var.v3["cloud"]
}

variable "v5" {}

output "Output5" {
  value = var.v5
}

variable "env" {}

output "Output6" {
  value = var.env
}
