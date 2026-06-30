
# Resource Group
resource "azurerm_resource_group" "ranjeet-rg" {
  name     = "ranjeet-three-tier-rg"
  location = "Central India"
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "three-tier-vnet"
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
  address_space       = ["10.0.0.0/16"]
}

# Web Subnet
resource "azurerm_subnet" "web_subnet" {
  name                 = "web-subnet"
  resource_group_name  = azurerm_resource_group.ranjeet-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# App Subnet
resource "azurerm_subnet" "app_subnet" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.ranjeet-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# DB Subnet
resource "azurerm_subnet" "db_subnet" {
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.ranjeet-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

# NICs
resource "azurerm_network_interface" "web_nic" {
  name                = "web-nic"
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.web_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "app_nic" {
  name                = "app-nic"
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.app_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "db_nic" {
  name                = "db-nic"
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.db_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Web VM
resource "azurerm_linux_virtual_machine" "web_vm" {
  name                = "web-vm"
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
  location            = azurerm_resource_group.ranjeet-rg.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  admin_password      = "Password@12345"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.web_nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# App VM
resource "azurerm_linux_virtual_machine" "app_vm" {
  name                = "app-vm"
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
  location            = azurerm_resource_group.ranjeet-rg.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  admin_password      = "Password@12345"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.app_nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# DB VM
resource "azurerm_linux_virtual_machine" "db_vm" {
  name                = "db-vm"
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
  location            = azurerm_resource_group.ranjeet-rg.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  admin_password      = "Password@12345"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.db_nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}