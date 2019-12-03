################################################
# template file for setting up a vpc with multiple or single subnet
################################################
resource "opentelekomcloud_vpc_v1" "vpc" {
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
  gateway_ip    = "${element(var.subnet_gateway, count.index % var.subnet_count)}"
  vpc_id        = "${opentelekomcloud_vpc_v1.vpc.id}"
  primary_dns   = "${var.primary_dns}"
  secondary_dns = "${var.secondary_dns}"

  lifecycle {
    prevent_destroy = "true"
    ignore_changes  = ["primary_dns", "secondary_dns"]
  }
}
#######################################################################################################################################
#  N.B: Multiple vpc and subnets the code above should be duplicated with different variable names to be passed in tfvars
#######################################################################################################################################

