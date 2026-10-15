
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region for the Resource Group"
  type        = string
  default     = "East US 2"
}

variable "resource_group_name" {
  description = "Name of the Resource Group to create"
  type        = string
  default     = "rg-hub-spoke-lab"
}

variable "tags" {
  description = "Tags applied to the Resource Group"
  type        = map(string)

  default = {
    project     = "hub-spoke"
    environment = "dev"
    managed_by  = "terraform"
  }
}
