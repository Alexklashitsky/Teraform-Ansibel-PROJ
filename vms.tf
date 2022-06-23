# resource "azurerm_windows_virtual_machine" "win_server" {
#   name                  = "win_server"
#   resource_group_name   = var.resource_group_name_poc
#   location              = var.location
#   size                  = "Standard_F2"
#   admin_username        = var.admin_user
#   admin_password        = var.secret
#   network_interface_ids = [module.network.win_net_interface_id]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-Datacenter"
#     version   = "latest"
#   }
# }
### Create virtual machine terminal for manging
resource "azurerm_linux_virtual_machine" "terminal" {
  name                  = "terminal"
  location              = var.location
  resource_group_name   = azurerm_resource_group.week6.name
  network_interface_ids = [module.network.terminal_net_interface_id]
  size                  = "Standard_F2"
  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "terminal"
  admin_username                  = var.admin_user
  admin_password                  = var.secret
  disable_password_authentication = false

}
