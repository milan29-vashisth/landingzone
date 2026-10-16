
resource "azurerm_resource_group" "network" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "hub" {
  source              = "./modules/vnet"
  name                = "vnet-hub"
  resource_group_name = azurerm_resource_group.network.name
  location            = var.location
  address_space       = var.hub_vnet_cidr
  subnet_name         = "snet-hub"
  subnet_prefixes     = var.hub_subnet_cidr
  tags                = var.tags
}

module "spoke_dev" {
  source              = "./modules/vnet"
  name                = "vnet-spoke-dev"
  resource_group_name = azurerm_resource_group.network.name
  location            = var.location
  address_space       = var.dev_vnet_cidr
  subnet_name         = "snet-workload-dev"
  subnet_prefixes     = var.dev_subnet_cidr
  tags                = merge(var.tags, { environment = "dev" })
}

module "spoke_uat" {
  source              = "./modules/vnet"
  name                = "vnet-spoke-uat"
  resource_group_name = azurerm_resource_group.network.name
  location            = var.location
  address_space       = var.uat_vnet_cidr
  subnet_name         = "snet-workload-uat"
  subnet_prefixes     = var.uat_subnet_cidr
  tags                = merge(var.tags, { environment = "uat" })
}

module "spoke_prod" {
  source              = "./modules/vnet"
  name                = "vnet-spoke-prod"
  resource_group_name = azurerm_resource_group.network.name
  location            = var.location
  address_space       = var.prod_vnet_cidr
  subnet_name         = "snet-workload-prod"
  subnet_prefixes     = var.prod_subnet_cidr
  tags                = merge(var.tags, { environment = "prod" })
}

# Hub -> Spokes
resource "azurerm_virtual_network_peering" "hub_to_dev" {
  name                      = "peer-hub-to-dev"
  resource_group_name       = azurerm_resource_group.network.name
  virtual_network_name      = module.hub.name
  remote_virtual_network_id = module.spoke_dev.id
}

resource "azurerm_virtual_network_peering" "hub_to_uat" {
  name                      = "peer-hub-to-uat"
  resource_group_name       = azurerm_resource_group.network.name
  virtual_network_name      = module.hub.name
  remote_virtual_network_id = module.spoke_uat.id
}

resource "azurerm_virtual_network_peering" "hub_to_prod" {
  name                      = "peer-hub-to-prod"
  resource_group_name       = azurerm_resource_group.network.name
  virtual_network_name      = module.hub.name
  remote_virtual_network_id = module.spoke_prod.id
}

# Spokes -> Hub
resource "azurerm_virtual_network_peering" "dev_to_hub" {
  name                      = "peer-dev-to-hub"
  resource_group_name       = azurerm_resource_group.network.name
  virtual_network_name      = module.spoke_dev.name
  remote_virtual_network_id = module.hub.id
}

resource "azurerm_virtual_network_peering" "uat_to_hub" {
  name                      = "peer-uat-to-hub"
  resource_group_name       = azurerm_resource_group.network.name
  virtual_network_name      = module.spoke_uat.name
  remote_virtual_network_id = module.hub.id
}

resource "azurerm_virtual_network_peering" "prod_to_hub" {
  name                      = "peer-prod-to-hub"
  resource_group_name       = azurerm_resource_group.network.name
  virtual_network_name      = module.spoke_prod.name
  remote_virtual_network_id = module.hub.id
}

module "private_dns" {
  source              = "./modules/private-dns"
  resource_group_name = azurerm_resource_group.network.name
  zone_name           = var.private_dns_zone_name

  virtual_network_ids = [
    module.hub.id,
    module.spoke_dev.id,
    module.spoke_uat.id,
    module.spoke_prod.id
  ]

  tags = var.tags
}
