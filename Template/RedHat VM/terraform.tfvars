#subscription 
sub_id					= "0d6ce570-7813-445e-bb22-e35faf195918"

#Resource group variables
rg_name 				= "testTerraform_rg"


#Virtual network variables
vn_name 				= "virtual_network01"

#Subnet variables
subn_name			 	= "internal"

#Public IP variables
pubip_name				= "pubip1"
pubip_method 			= "Dynamic"
var_timeout_in_mins 	= 30

#Nic variables
nic_name				= "redhat_nic"
#nic_ip_name			= "internal"
nic_ip_address_location	= "Dynamic"

#NSG name
nsg_name				= "networksecuritygroup"

#rules of NSG
rules_nsgrules = {
   
    ssh = {
      name                       = "ssh"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range    = "22"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    }
 
}
#VM variables
vm_name					= "RedHatVMvm"
vm_size					= "Standard_F2"
vm_admin_user			= "dsantorelli"
vm_password				= "Dsantorelli1"					  
vm_admin_ssh_key		= "dsantorelli"
vm_region 				= "westeurope"


#Disk variables
disk_caching			= "ReadWrite"
disk_storage_account	= "Standard_LRS"

#Os variables
os_offer				= "RHEL"
os_sku       			= "7-RAW"
os_version   			= "latest"

#List of tags of the VM
tags = {
	Author = "Daniele Santorelli"
	Environment = "Dev"
	Project = "Terraform"
	Region = "westeurope"
	ResourceScope = "TestTerraform_rg"
}


#Data Disks
disk = {
  disk1 ={
	  name 					= "disk1"
	  storage_account_type 	= "Standard_LRS"
	  create_option        	= "Empty"
	  disk_size_gb         	= 10	
	  lun					= 0
	  caching				= "ReadWrite"
  }
  disk2 ={
	  name 					= "disk2"
	  storage_account_type 	= "Standard_LRS"
	  create_option        	= "Empty"
	  disk_size_gb         	= 10
	  lun					= 1
	  caching				= "ReadWrite"
  }
}