resource "null_resource" "demo" {
  count = length(var.demo)
  provisioner "local-exec" {
    command = "echo ${var.demo[count.index]}"
  }
}
variable "demo" {
  default = [
              "orange",
              "apple",
              "banana",

  ]
}
resource "local_file" "foo" {
  count = length(var.demo)
  content = var.demo[count.index]
  filename = "/tmp/file-${count.index}"
}


