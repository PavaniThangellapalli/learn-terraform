resource "local_file" "foo" {
  for_each = var.demo
  content = each.value
  filename = "/tmp/${each.value}"
}
variable "demo" {
  default = {
    APPLE  = "apple"
    ORANGE = "orange"
    BANANA = "banana"
    MANGO  = "mango"
  }
}