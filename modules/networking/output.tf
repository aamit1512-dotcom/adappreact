output "nsg_ids" {
  description = "Map of NSG IDs"
  value = {
    for k, nsg in azurerm_network_security_group.nsg :
    k => nsg.id
  }
}
output "nsg_names" {
  description = "Map of NSG names"
  value = {
    for k, nsg in azurerm_network_security_group.nsg :
    k => nsg.name
  }
}



output "vnet_ids" {
  description = "Map of VNet IDs"
  value = {
    for k, vnet in azurerm_virtual_network.vnet :
    k => vnet.id
  }
}

output "subnet_ids" {
  value = {
    for key, subnet in azurerm_subnet.subnet :
    key => subnet.id
  }
}
output "vnet_names" {
  value = {
    for k, v in azurerm_virtual_network.vnet :
    k => v.name
  }
}


