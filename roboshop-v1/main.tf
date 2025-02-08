module "frontend" {
  source = "./vm"
  component = "frontend"
}
module "mongodb" {
  source = "./vm"
  component = "mongodb"
}
