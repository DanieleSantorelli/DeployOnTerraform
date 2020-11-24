#subscription 
sub_id					        = "0d6ce570-7813-445e-bb22-e35faf195918"

#Resource group variables
rg_name 				        = "testTerraform_rg"


#Virtual network variables
vn_name 			      	  = "virtual_network01"

#Subnet variables
subn_name			 	        = "internal"

#Public IP variables
pubip_name				      = "pubip2"
pubip_method 			      = "Dynamic"
var_timeout_in_mins 	  = 30

#Nic variables
nic_name				        = "Windows_nic2"
nic_ip_address_location	= "Dynamic"

#NSG name
nsg_name				        = "networksecuritygroup2"

#rules of NSG
rules_nsgrules = {
   
    rdp = {
      name                       = "rdp"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range      = "3389"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    }
 
    sql = {
      name                       = "sql"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "SqlManagement"
      destination_address_prefix = "192.168.2.0/24"
    }
 
    http = {
      name                       = "http"
      priority                   = 201
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "192.168.2.0/24"
    }
}

#VM variables
vm_name					        = "WindowsVM2"
vm_size					        = "Standard_F2"
vm_admin_user			      = "dsantorelli"
vm_password				      = "Dsantorelli1"
vm_region 				      = "westeurope"

#Disk variables
disk_caching			      = "ReadWrite"
disk_storage_account	  = "Standard_LRS"

#Os variables
os_offer				        = "windows-7"
os_sku       			      = "win7-enterprise"
os_version   			      = "latest"

#List of tags of the VM
tags = {
	Author                = "Daniele Santorelli"
	Environment           = "Dev"
	Project               = "Terraform"
	Region                = "westeurope"
	ResourceScope         = "TestTerraform_rg"
}

#Data Disks
disk = {
  disk1 ={
	  name 					        = "disk1"
	  storage_account_type 	= "Standard_LRS"
	  create_option        	= "Empty"
	  disk_size_gb         	= 10	
	  lun					          = 0
	  caching				        = "ReadWrite"
  }
  disk2 ={
	  name 					        = "disk2"
	  storage_account_type 	= "Standard_LRS"
	  create_option        	= "Empty"
	  disk_size_gb         	= 10
	  lun					          = 1
	  caching				        = "ReadWrite"
  }
}
