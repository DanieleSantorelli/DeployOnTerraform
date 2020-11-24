provider "azurerm" {
  features {}
  version = "=2.6.0"
  subscription_id = var.sub_id
}

#Resource group where install the VM 
data "azurerm_resource_group" "resource_group_01" {
  name     = var.rg_name
}

#resource "random_integer" "ri" {
#  min = 10000
#  max = 99999
#}

resource "azurerm_cosmosdb_account" "db" {
  name                = var.cosmos.name
  location            = var.cosmos.location
  resource_group_name = data.azurerm_resource_group.resource_group_01.name
  offer_type          = var.cosmos.offer_type
  kind                = var.cosmos.kind

  enable_automatic_failover = true
  
  dynamic "capabilities" {
    for_each = var.capabilities_cosmos
    content{
		name = capabilities.value.name
	}
  }
  
  consistency_policy {
    consistency_level       = var.consistency_policy.consistency_level
    max_interval_in_seconds = var.consistency_policy.max_interval_in_seconds
    max_staleness_prefix    = var.consistency_policy.max_staleness_prefix
  }

  geo_location {
    location          = var.geo_location_failover_1
    failover_priority = 1
  }

  geo_location {
    location          = var.cosmos.location
    failover_priority = 0
  }
}
