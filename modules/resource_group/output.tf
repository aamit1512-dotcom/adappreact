output "rg_names" {
  description = "Map of resource group names"
  value = {
    for key, rg in azurerm_resource_group.resourcegroup :
    key => rg.name
  }
}

output "rg_locations" {
  description = "Map of resource group locations"
  value = {
    for key, rg in azurerm_resource_group.resourcegroup :
    key => rg.location
  }
}
