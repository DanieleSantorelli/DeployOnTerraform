#Variable definition
variable "sub_id" {
  description = "Subscription ID"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group where the infrastructure is to be deployed"
  type        = string
}

variable "sql_server" {
  description = "Sql Server definitions"
  type        = map(string)
}

variable "tags_sql_server" {
  description = "Tags of Sql Server"
  type        = map(string)
}

variable "storage_account" {
  description = "Storage account definitions"
  type		  = map(string)
}

variable "sql_database" {
  description = "Sql database definitions"
  type		  = map(string)
}

variable "sql_db_extended_auditing_policy" {
  description = "Extended auditing policy of the sql database"
  type		  = map(string)
}

variable "tags_sql_database" {
  description = "Tags of Sql Server"
  type        = map(string)
}