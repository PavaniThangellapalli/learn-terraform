module "sample" {
  source = "./sample"
  output "x" {
    value = var.x
  }
  output "y" {
    value = var.y
  }
}
variable "x" {}
variable "y" {}

