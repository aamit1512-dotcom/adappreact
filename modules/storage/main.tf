resource "random_id" "sa" {
  for_each    = var.storage_accounts
  byte_length = 4
}

locals {
  storage_account_names = {
    for k, v in var.storage_accounts :
    k => substr(lower("stg${random_id.sa[k].hex}"), 0, 24)
  }
}

resource "azurerm_storage_account" "stg_acc" {
  for_each = var.storage_accounts

  name                     = local.storage_account_names[each.key]
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"

  tags = each.value.tags
}

resource "azurerm_storage_container" "container" {
  for_each = var.containers

  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.stg_acc[each.key].name
  container_access_type = each.value.container_access_type
}


