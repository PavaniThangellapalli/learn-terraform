module "sample" {
  source = "./sample"
  output "x" {
    value = var.x
  }
  output "y" {
    value = var.x
  }
}
variable "x" {}
variable "y" {}

