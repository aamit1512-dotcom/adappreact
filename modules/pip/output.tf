output "public_ip_ids" {
  description = "Map of Public IP IDs keyed by public_ips map key"

  value = {
    for k, p in azurerm_public_ip.pip :
    k => p.id
  }
}
