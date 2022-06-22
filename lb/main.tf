# # #LB
# resource "azurerm_lb" "LB" {
#   name                = "LoadBalancer"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   sku                 = "Standard"

#   frontend_ip_configuration {
#     name                 = "PublicIPAddress"
#     public_ip_address_id = var.public_ip
#   }
# }

# # backendpool

# resource "azurerm_lb_backend_address_pool" "backendPool" {

#   name            = "BackEndAddressPool"
#   loadbalancer_id = azurerm_lb.LB.id

# }

# # porde

# resource "azurerm_lb_probe" "LB" {
#   loadbalancer_id = azurerm_lb.LB.id
#   name            = "ssh-running-probe"
#   port            = var.application_port
# }

# # lb rules

# resource "azurerm_lb_rule" "lbnatrule" {
#   loadbalancer_id                = azurerm_lb.LB.id
#   name                           = "http"
#   protocol                       = "Tcp"
#   frontend_port                  = var.application_port
#   backend_port                   = var.application_port
#   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backendPool.id]
#   frontend_ip_configuration_name = "PublicIPAddress"
#   probe_id                       = azurerm_lb_probe.LB.id
#   disable_outbound_snat          = true
# }

# # lboutboundrule

# resource "azurerm_lb_outbound_rule" "outRule" {
#   loadbalancer_id         = azurerm_lb.LB.id
#   name                    = "OutboundRule"
#   protocol                = "All"
#   backend_address_pool_id = azurerm_lb_backend_address_pool.backendPool.id

#   frontend_ip_configuration {
#     name = "PublicIPAddress"


#   }
# }
# # # # privte DNS

# resource "azurerm_private_dns_zone" "dns" {
#   name                = "tracker.postgres.database.azure.com"
#   resource_group_name = var.resource_group_name
# }

# resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
#   name                  = "dns_link"
#   private_dns_zone_name = azurerm_private_dns_zone.dns.name
#   virtual_network_id    = module.network.vnet_id
#   resource_group_name   = var.resource_group_name
# }
