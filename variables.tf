
variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "location" {
  type    = string
  default = "East US 2"
}

variable "resource_group_name" {
  type    = string
  default = "rg-hub-spoke-lab"
}

variable "hub_vnet_cidr" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "hub_subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "dev_vnet_cidr" {
  type    = list(string)
  default = ["10.1.0.0/16"]
}

variable "dev_subnet_cidr" {
  type    = list(string)
  default = ["10.1.1.0/24"]
}

variable "uat_vnet_cidr" {
  type    = list(string)
  default = ["10.2.0.0/16"]
}

variable "uat_subnet_cidr" {
  type    = list(string)
  default = ["10.2.1.0/24"]
}

variable "prod_vnet_cidr" {
  type    = list(string)
  default = ["10.3.0.0/16"]
}

variable "prod_subnet_cidr" {
  type    = list(string)
  default = ["10.3.1.0/24"]
}

variable "private_dns_zone_name" {
  type    = string
  default = "internal.local"
}

variable "tags" {
  type = map(string)

  default = {
    project    = "hub-spoke"
    managed_by = "terraform"
  }
}
