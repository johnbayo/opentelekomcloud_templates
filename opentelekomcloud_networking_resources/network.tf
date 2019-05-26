################################################
# template file for setting up a vpc with multiple or single subnet
################################################
resource "opentelekomcloud_vpc_v1" "vpc_test" {
  name = "${var.vpc_name}"
  cidr = "${var.vpc_cidr}"

  lifecycle {
    prevent_destroy = "true"
  }
}

resource "opentelekomcloud_vpc_subnet_v1" "subnet" {
  name          = "${element(var.subnet_name, count.index % var.subnet_count)}"
  count         = "${var.subnet_count}"
  cidr          = "${element(var.subnet_cidr, count.index % var.subnet_count)}"
  gateway_ip    = "${cidrhost(element(var.subnet_cidr, count.index % var.subnet_count), 1)}"
  vpc_id        = "${opentelekomcloud_vpc_v1.vpc_test.id}"
  primary_dns   = "${var.primary_dns}"
  secondary_dns = "${var.secondary_dns}"

  lifecycle {
    prevent_destroy = "true"
  }
}

#######################################################################################################################################
#  N.B: Multiple vpc and subnets the code above should be duplicated with different variable names to be passed in tfvars
#######################################################################################################################################

##############################################
#  Variables 
##############################################

variable "vpc_cidr" {
  description = "The Vpc Network"
}

variable "vpc_name" {
  description = "The Name of the vpc"
}

variable "subnet_name" {
  description = "The Name of the subnet"
  type        = "list"
}

variable "subnet_cidr" {
  description = "The Name of the subnet"
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

