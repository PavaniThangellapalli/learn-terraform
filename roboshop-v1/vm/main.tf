resource "azurerm_network_interface" "nic" {
  name                = "${var.component}-nic"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}
resource "azurerm_public_ip" "public_ip" {
  allocation_method   = "Dynamic"
  location            = data.azurerm_resource_group.rg.location
  name                = "${var.component}-public-ip"
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = "Basic"
}
resource "azurerm_network_interface_security_group_association" "nsgnic" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}
resource "azurerm_virtual_machine" "main" {
  name                = var.component
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size             = "Standard_DS1_v2"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/ef791f67-7558-4920-ba6c-72951b295947/resourceGroups/project-setup/providers/Microsoft.Compute/galleries/CustomImage/images/CustomImage/versions/1.0.0"
  }
  storage_os_disk {
    name              = "${var.component}-OS-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.component
    admin_username = "pavani"
    admin_password = "UseMind@1234"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = var.component
  }
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "pavani"
      password = "UseMind@1234"
      host     = azurerm_public_ip.public_ip.ip_address
    }
    inline = [
      "sudo dnf install python3.12-pip",
      "pip3.12 install ansible",
      "ansible-pull -i -localhost -U https://github.com/PavaniThangellapalli/roboshop-shell.git, -e ENV=dev -e app_name=${var.component} roboshop.yml"
    ]
  }
}