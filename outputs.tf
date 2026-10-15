
output "resource_group_id" {
  description = "ID of the created Resource Group"
  value       = module.network_rg.id
}

output "resource_group_name" {
  description = "Name of the created Resource Group"
  value       = module.network_rg.name
}

output "resource_group_location" {
  description = "Location of the created Resource Group"
  value       = module.network_rg.location
}
