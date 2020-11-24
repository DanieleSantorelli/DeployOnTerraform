#subscription 
sub_id							= "0d6ce570-7813-445e-bb22-e35faf195918"

#Resource group variables
rg_name 						= "testTerraform_rg"

#Cosmos Definition
cosmos = {
	name 						= "cosmossseterraform"
	location 					= "westeurope"
	offer_type					= "Standard"
	kind						= "GlobalDocumentDB"
	enable_automatic_failover	= true
	
}

#Capabilities cosmos
capabilities_cosmos ={
	capabilities1 = {
		name					= "EnableAggregationPipeline"
	}
	capabilities2 = {
		name					= "mongoEnableDocLevelTTL"
	}
	capabilities3 = {
		name					= "MongoDBv3.4"
	}
}

#Consistency policy of the Cosmos DB
consistency_policy = {
	consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 301
    max_staleness_prefix    = 200000
}

#The location to used in case of failover on the main location
geo_location_failover_1 		= "northeurope"

