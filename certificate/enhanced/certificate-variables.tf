##############################################
# Open Telekom Cloud Log in Credentials
##############################################
variable "user_name" {}

variable "password" {}

variable "domain_name" {}

variable "tenant_name" {}

variable "auth_url" {}

variable "region" {
  default = "eu-de"
}

##############################################
# Certificate variable
##############################################
variable "api_version" {
  default = "v2.0"
}

variable "resource_type" {
  default = "elb"
}

variable "resource_url" {
  default = "lbaas/certificates"
}

variable "domain" {
  type = "list"
}
