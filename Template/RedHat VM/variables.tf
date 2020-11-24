#Variable definition
variable "rg_name" {
  description = "Name of the resource group where the infrastructure is to be deployed"
  type        = string
}

variable "vn_name" {
  description = "Name of the virtual network where the vm is connect"
  type        = string
}

variable "subn_name" {
  description = "Name of the subnet"
  type        = string
}

variable "pubip_name" {
  description = "Name of the public IP address"
  type        = string
}

variable "pubip_method" {
  description = "Method of the public IP address"
  type        = string
}

variable "var_timeout_in_mins" {
  description = "Timeout of the public IP address"
  type        = string
}

variable "nic_name" {
  description = "Name of the network interface"
  type        = string
}

variable "nic_ip_address_location" {
  description = "IP configuration address location of the network interface"
  type        = string
}

variable "vm_name" {
  description = "Name of the Red Hat virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Red Hat virtual machine"
  type        = string
}

variable "vm_admin_user" {
  description = "Admin user of the Red Hat virtual machine"
  type        = string
}

variable "vm_admin_ssh_key" {
  description = "Admin user to access in SSH to the Red Hat virtual machine"
  type        = string
}

variable "vm_password" {
  description = "Password to connect the virtual machine"
  type        = string
}

variable "vm_region" {
  description = "Azure region where the infrastructure is to be deployed"
  type        = string
}

variable "disk_caching" {
  description = "Caching of the disk"
  type        = string
}

variable "disk_storage_account" {
  description = "Type of the storage account"
  type        = string
}

variable "os_offer" {
  description = "OS Offer of the Red Hat (RHEL/rhel-byos)"
  type        = string
}

variable "os_sku" {
  description = "OS Sku of the Red Hat"
  type        = string
}

variable "os_version" {
  description = "OS Version of the Red Hat"
  type        = string
}

variable "rules_nsgrules"{
	description = "A list of rules of the NSG"
	type = map(map(string))
}

variable "nsg_name" {
  description = "Name of the nsg"
  type = string
}

variable "sub_id" {
  description = "Subscription ID"
  type        = string
}

variable "tags" {
  description = "A list of tags associated to all VM"
  type        = map(string)
}

variable "disk"{
	description = "A list of parameters of the data"
	type = map(map(string))
}
