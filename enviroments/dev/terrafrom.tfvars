
subscription_id = "6349a94a-bcc7-4da7-8f36-2f6bc3017bf7"

location            = "East US 2"
resource_group_name = "rg-hub-spoke-lab"

hub_vnet_cidr    = ["10.0.0.0/16"]
hub_subnet_cidr  = ["10.0.1.0/24"]

dev_vnet_cidr    = ["10.1.0.0/16"]
dev_subnet_cidr  = ["10.1.1.0/24"]

uat_vnet_cidr    = ["10.2.0.0/16"]
uat_subnet_cidr  = ["10.2.1.0/24"]

prod_vnet_cidr   = ["10.3.0.0/16"]
prod_subnet_cidr = ["10.3.1.0/24"]

private_dns_zone_name = "internal.local"

tags = {
  project    = "hub-spoke"
  managed_by = "terraform"
}
