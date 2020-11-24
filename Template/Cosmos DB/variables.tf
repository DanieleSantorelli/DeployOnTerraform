#Variable definition
variable "sub_id" {
  description = "Subscription ID"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group where the infrastructure is to be deployed"
  type        = string
}

variable "cosmos" {
  description = "Cosmos Definition"
  type        = map(string)
}

variable "capabilities_cosmos" {
  description = "Cosmos capabilities"
  type        = map(map(string))
}

variable "consistency_policy"{
  description = "Consistency policy of the Cosmos DB"
  type        = map(string)
}

variable "geo_location_failover_1"{
  description = "The location to used in case of failover on the main location"
  type        = string
}
