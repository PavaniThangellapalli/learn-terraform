module "sample" {
  source = "./sample"
  x = var.x
  y = var.y
}
variable "x" {}
variable "y" {}

output "x" {
  value = var.x
}
output "y" {
  value = var.y
}
