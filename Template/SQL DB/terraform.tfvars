#subscription 
sub_id										= "0d6ce570-7813-445e-bb22-e35faf195918"

#Resource group variables
rg_name 									= "testTerraform_rg"

#Sql Server definitions
sql_server = {
	name									= "sqlserversseterraform"
	location								= "westeurope"
	version									= "12.0"
	administrator_login						= "dsantorelli"
	administrator_login_password			= "sse-040288_DSant0relli1-sse"
}

#Tags sql server
tags_sql_server = {
	Author 									= "Daniele Santorelli"
	Environment 							= "Dev"
	Project 								= "Terraform"
	Region 									= "westeurope"
	ResourceScope 							= "TestCreation"
}

#Storage Account definitions
storage_account = {
	name									= "sqlserverssesa"
	location								= "westeurope"
	account_tier							= "Standard"
	account_replication_type				= "LRS"
}

#Sql Database definitions
sql_database = {
	name									= "firstqldatabase"
	location								= "westeurope"
}

#Extended auditing policy of the sql database
sql_db_extended_auditing_policy = {
	storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
}

#Tags sql database
tags_sql_database = {
	Author 									= "Daniele Santorelli"
	Environment 							= "Dev"
	Project 								= "Terraform"
	Region 									= "westeurope"
	ResourceScope 							= "TestCreation"
}