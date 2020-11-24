provider "azurerm" {
  features {}
  version = "=2.6.0"
  subscription_id = var.sub_id
}

#Resource group where install the VM 
data "azurerm_resource_group" "resource_group_01" {
  name     = var.rg_name
}

#Virtual network where install the VM
data "azurerm_virtual_network" "virtual_network_01" {
  name                = var.vn_name
  resource_group_name = data.azurerm_resource_group.resource_group_01.name
}

#Subnet where install the VM
data "azurerm_subnet" "subnet_01" {
  name                 = var.subn_name
  resource_group_name  = data.azurerm_resource_group.resource_group_01.name
  virtual_network_name = data.azurerm_virtual_network.virtual_network_01.name
}

#Creation public ip address
resource "azurerm_public_ip" "pub_ip" {
  name                    = var.pubip_name
  location                = data.azurerm_resource_group.resource_group_01.location
  resource_group_name     = data.azurerm_resource_group.resource_group_01.name
  allocation_method       = var.pubip_method
  idle_timeout_in_minutes = var.var_timeout_in_mins
}

#Creation network interface
resource "azurerm_network_interface" "network_interface_01" {
  name                = var.nic_name
  location            = var.vm_region
  resource_group_name = data.azurerm_resource_group.resource_group_01.name

  ip_configuration {
    name						              = data.azurerm_subnet.subnet_01.name
	  subnet_id                     = data.azurerm_subnet.subnet_01.id
    private_ip_address_allocation = var.nic_ip_address_location
	public_ip_address_id            = azurerm_public_ip.pub_ip.id
  }
}

#Creation NSG
resource "azurerm_network_security_group" "network_security_group_1" {
  name                = var.nsg_name
  location            = var.vm_region
  resource_group_name = data.azurerm_resource_group.resource_group_01.name
}

#Creation Rules of NSG
resource "azurerm_network_security_rule" "rules" {
  for_each                    = var.rules_nsgrules 
  name                        = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = data.azurerm_resource_group.resource_group_01.name
  network_security_group_name = azurerm_network_security_group.network_security_group_1.name
}

#Associate NSG and NIC
resource "azurerm_network_interface_security_group_association" "connectNICwithNSG" {
  network_interface_id      = azurerm_network_interface.network_interface_01.id
  network_security_group_id = azurerm_network_security_group.network_security_group_1.id
}

#Creation Virtual Machine
resource "azurerm_linux_virtual_machine" "linux_virtual_machine_01" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.resource_group_01.name
  location            = var.vm_region
  size                = var.vm_size
  admin_username      = var.vm_admin_user
  admin_password      = var.vm_password
  network_interface_ids = [
    azurerm_network_interface.network_interface_01.id,
  ]

  admin_ssh_key {
    username   = var.vm_admin_ssh_key
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = var.disk_caching
    storage_account_type = var.disk_storage_account
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }
  tags 	= var.tags			  
}

#Creation Data disks
resource "azurerm_managed_disk" "datadisk" {
  for_each             = var.disk 
  name                 = "${azurerm_linux_virtual_machine.linux_virtual_machine_01.name}-${each.value.name}"
  location             = data.azurerm_resource_group.resource_group_01.location
  resource_group_name  = data.azurerm_resource_group.resource_group_01.name
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb
}
#Attach the data disks to the VM
resource "azurerm_virtual_machine_data_disk_attachment" "attachDataDiskstoVM" {
  for_each           = var.disk
  managed_disk_id    = azurerm_managed_disk.datadisk[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.linux_virtual_machine_01.id
  lun                = each.value.lun
  caching            = each.value.caching
}