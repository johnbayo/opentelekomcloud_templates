resource "opentelekomcloud_vpc_eip_v1" "eip_resource" {
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
