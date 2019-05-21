variable "prefix" {
  default = "beaulabs"
}

variable "location" {
  default = "west us"
}

variable "admin_name" {
  description = "The admin name you wish to use to access the vm."
  default     = "beau"
}

variable "tags" {
  type = "map"

  default = {
    environment = "development"
    owner       = "beaulabs"
  }
}
