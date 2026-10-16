
output "resource_group_name" {
  value = azurerm_resource_group.network.name
}

output "hub_vnet_id" {
  value = module.hub.id
}

output "dev_vnet_id" {
  value = module.spoke_dev.id
}

output "uat_vnet_id" {
  value = module.spoke_uat.id
}

output "prod_vnet_id" {
  value = module.spoke_prod.id
}

output "private_dns_zone_id" {
  value = module.private_dns.zone_id
}
