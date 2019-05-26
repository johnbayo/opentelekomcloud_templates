provider "opentelekomcloud" {
  user_name   = "${var.user_name}"
  password    = "${var.password}"
  tenant_name = "${var.tenant_name}"
  domain_name = "${var.domain_name}"
  auth_url    = "${var.auth_url}"
  region      = "${var.region}"
}

##############################################
# Open Telekom Cloud Log in Credentials
##############################################
variable "user_name" {}

variable "password" {}

variable "domain_name" {}

variable "tenant_name" {}

variable "auth_url" {}

variable "region" {}
