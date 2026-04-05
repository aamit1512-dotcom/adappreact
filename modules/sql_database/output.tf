

output "database_id" {
  value = azurerm_mssql_database.sql_db.id
}

output "database_name" {
  value = azurerm_mssql_database.sql_db.name
}
