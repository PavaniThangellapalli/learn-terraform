provider "vault" {
  address = "http://vault-public.pavanidevops.online:8200"
  token = var.token
}
variable "token" {}
# search for data source “vault_generic_secret” in terraform doc, for retrieving the password
data "vault_generic_secret" "secret_data" {
  path = "test/demo-ssh"
}
resource "local_file" "local" {
  filename = "/tmp/pass"
  content = data.vault_generic_secret.secret_data.data["password"]
}
data "vault_kv_secret" "secret_data" {
  path = "test/data/demo-ssh"
}
resource "local_file" "local1" {
filename = "/tmp/pass1"
content = replace(replace(jsonencode(data.vault_kv_secret.secret_data), "\"", ""), ":", "=")
}