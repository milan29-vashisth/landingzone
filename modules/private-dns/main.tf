
resource "azurerm_private_dns_zone" "this" {
  name                = var.zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each = {
    hub  = var.virtual_network_ids[0]
    dev  = var.virtual_network_ids[1]
    uat  = var.virtual_network_ids[2]
    prod = var.virtual_network_ids[3]
  }

  name                  = "link-${each.key}"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = each.value
  registration_enabled  = false
  tags                  = var.tags
}
