resource "opentelekomcloud_vpc_eip_v1" "eip_test" {
  count = "${var.eip_count}"

  publicip {
    type = "5_bgp"
  }

  bandwidth {
    name       = "${element(var.bandwidth_name, count.index % var.eip_count)}"
    size       = "${element(var.eip_size, count.index % var.eip_count)}"
    share_type = "PER"
  }

  lifecycle {
    prevent_destroy = "true"
  }
}
##############################################
#  EIP
##############################################
variable "eip_count" {
  description = "Count of the eips"
}

variable "bandwidth_name" {
  description = "The Name of the bandwidth"
  type        = "list"
}

variable "eip_size" {
  description = "The Name of the bandwidth"
  type        = "list"
}
