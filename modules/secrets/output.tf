output "kv_rg_name" {
  value = {
    for k, kv in azurerm_key_vault.kv :
    k => kv.resource_group_name
  }
}
output "kv_name" {
  value = {
    for k, kv in azurerm_key_vault.kv :
    k => kv.name
  }
}
output "key_vault_ids" {
  description = "Map of Key Vault IDs"
  value = {
    for k, kv in azurerm_key_vault.kv :
    k => kv.id
  }
}
