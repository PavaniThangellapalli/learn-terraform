resource "null_resource" "demo" {
  count = length(var.demo)
  provisioner "local-exec" {
    command = "Fruit ${var.demo[count.index]}"
  }
}
variable "demo" {
  default = [
              "apple",
              "banana"
  ]
}