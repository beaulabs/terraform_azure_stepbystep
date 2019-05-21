variable "prefix" {
  description = "The prefix to be used for resources."
  default     = "beaulabs"
}

variable "location" {
  description = "The region you want to deploy resources into."
  default     = "west us"
}

variable "resource_group_name" {
  description = "The resource group you want to use."
  default     = "beaulabs-azgbc"
}

variable "tags" {
  type    = "map"
  default = {}
}
