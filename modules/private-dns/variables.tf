
variable "resource_group_name" {
  type = string
}

variable "zone_name" {
  type = string
}

variable "virtual_network_ids" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}
