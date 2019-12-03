resource "opentelekomcloud_nat_gateway_v2" "nat_gw" {
  count               = "${var.natgw_count}"
  name                = "${element(var.natgw_name, count.index % var.natgw_count)}"
  spec                = "${var.natgw_size}"
  router_id           = "${opentelekomcloud_vpc_v1.vpc.id}"
  internal_network_id = "${element(opentelekomcloud_vpc_subnet_v1.subnet.*.id, var.natgw_subnet_index[count.index])}"
}

resource "opentelekomcloud_nat_snat_rule_v2" "snat_rule" {
  count          = "${var.natgw_rule_count}"
  nat_gateway_id = "${element(opentelekomcloud_nat_gateway_v2.nat_gw.*.id, var.natgw_rule_gw_index[count.index])}"
  network_id     = "${element(opentelekomcloud_nat_gateway_v2.nat_gw.*.internal_network_id, var.natgw_rule_gw_index[count.index])}"
  floating_ip_id = "${element(opentelekomcloud_vpc_eip_v1.eip_resource.*.id, var.natgw_rule_eip_index[count.index])}"
}
