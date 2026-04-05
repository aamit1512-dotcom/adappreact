variable "storage_accounts" {
  type = map(object({
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
  }))
}

variable "containers" {
  description = "Storage containers"
  type = map(object({
    name                   = string
    container_access_type  = string
  }))
  default = {}
}
