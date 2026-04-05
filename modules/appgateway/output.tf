output "appgw_id" {
  value = azurerm_application_gateway.appgw.id
}

output "backend_pool_id" {
  value = one([
  for p in azurerm_application_gateway.appgw.backend_address_pool :
  p.id if p.name == local.backend_address_pool_name
])

}
