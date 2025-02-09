resource "local_file" "foo" {
  for_each = var.demo
  content  = each.value["content"]
  filename = "/tmp/${each.key}"
}
variable "demo" {
  default  = {
    APPLE  = {
      content = "apple is good for health"
    }
    BANANA = {
      content = "banana is good for weight gain"
    }
    ORANGE = {
      content = "orange is good for Vitamin C intake"
    }
  }
}

