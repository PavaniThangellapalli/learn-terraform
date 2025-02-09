resource "local_file" "foo" {
  for_each = var.demo
  content = each.value
  filename = "/tmp/${each.key}"
}
variable "demo" {
  default = {
    APPLE  = "apple"
    ORANGE = "orange"
    BANANA = "banana"
    MANGO  = "mango"
  }
}