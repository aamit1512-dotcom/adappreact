resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

locals {
 sql_server_name = "sqlsrv-${random_string.suffix.result}"
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = local.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.administrator_username
  administrator_login_password = var.administrator_password
  minimum_tls_version          = "1.2"

  tags = var.tags
}
