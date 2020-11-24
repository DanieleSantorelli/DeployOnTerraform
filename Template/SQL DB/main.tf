provider "azurerm" {
  features {}
  version 						= "=2.6.0"
  subscription_id 				= var.sub_id
}

#Resource group where install the VM 
data "azurerm_resource_group" "resource_group_01" {
  name     						= var.rg_name
}

resource "azurerm_sql_server" "azurerm_sql_server1" {
  name                         	= var.sql_server.name
  resource_group_name          	= data.azurerm_resource_group.resource_group_01.name
  location                     	= var.sql_server.location
  version                      	= var.sql_server.version
  administrator_login          	= var.sql_server.administrator_login
  administrator_login_password 	= var.sql_server.administrator_login_password

  tags = var.tags_sql_server
}

resource "azurerm_storage_account" "azurerm_storage_account1" {
  name                     		= var.storage_account.name
  resource_group_name      		= data.azurerm_resource_group.resource_group_01.name
  location                 		= var.storage_account.location
  account_tier             		= var.storage_account.account_tier
  account_replication_type 		= var.storage_account.account_replication_type
}

resource "azurerm_sql_database" "azurerm_sql_database1" {
  name                			= var.sql_database.name
  resource_group_name 			= data.azurerm_resource_group.resource_group_01.name
  location            			= var.sql_database.location
  server_name         			= azurerm_sql_server.azurerm_sql_server1.name

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.azurerm_storage_account1.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.azurerm_storage_account1.primary_access_key
    storage_account_access_key_is_secondary = var.sql_db_extended_auditing_policy.storage_account_access_key_is_secondary
    retention_in_days                       = var.sql_db_extended_auditing_policy.retention_in_days
  }
  
  tags = var.tags_sql_database
}