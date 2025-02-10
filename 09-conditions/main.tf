variable "a" {}

output "test" {
  value = var.a > 10 ? "a is greater than 10" : "a is less than 10"
}
resource "null_resource" "test1" {
  count = var.a > 10 ? 1 : 0
}
locals {
  count = var.a > 10 ? 1 : 0
}
resource "null_resource" "test2" {
  count = local.count
}
