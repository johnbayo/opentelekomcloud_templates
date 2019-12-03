##############################################
#  Network
##############################################
variable "vpc_cidr" {
  description = "The Vpc Network cidr"
}

variable "vpc_name" {
  description = "The Name of the vpc"
}

variable "subnet_name" {
  description = "The Name of the subnet"
  type        = "list"
}

variable "subnet_gateway" {
  description = "The Gateway ipaddress"
  type        = "list"
}

variable "subnet_cidr" {
  description = "The subnet Cidrs"
  type        = "list"
}

variable "subnet_count" {
  description = "Number of Subnets to be created"
}

variable "primary_dns" {
  description = "dns address"
}

variable "secondary_dns" {
  description = "dns address"
}
