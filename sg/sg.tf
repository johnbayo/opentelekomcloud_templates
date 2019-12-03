###################################################################
#  security-groups definition
###################################################################
resource "opentelekomcloud_networking_secgroup_v2" "secgroup_test" {
  name  = "sg-${element(var.sg_name, count.index)}"
  count = "${var.sg_count}"

  lifecycle {
    #    prevent_destroy = "true"
  }
}

###################################################################
#  security group rules with ip
###################################################################
resource "opentelekomcloud_networking_secgroup_rule_v2" "ip_rules_sg" {
  count             = "${var.ip_sg_rules_count}"
  direction         = "ingress"
  port_range_min    = "${element(var.ip_lower_port, count.index % var.ip_sg_rules_count)}"
  port_range_max    = "${element(var.ip_upper_port,count.index % var.ip_sg_rules_count)}"
  ethertype         = "IPv4"
  protocol          = "${element(var.ip_proto,count.index % var.ip_sg_rules_count)}"
  remote_ip_prefix  = "${element(var.ip_range, count.index % var.ip_sg_rules_count)}"
  security_group_id = "${element(opentelekomcloud_networking_secgroup_v2.secgroup_test.*.id, var.ip_rules_index[count.index])}"

  lifecycle {
    #    prevent_destroy = "true"
  }
}

###################################################################
#  security group rules with security group
###################################################################
resource "opentelekomcloud_networking_secgroup_rule_v2" "sg_rules_sg" {
  count             = "${var.sg_sg_rules_count}"
  direction         = "ingress"
  port_range_min    = "${element(var.sg_lower_port, count.index % var.sg_sg_rules_count)}"
  port_range_max    = "${element(var.sg_upper_port, count.index % var.sg_sg_rules_count)}"
  ethertype         = "IPv4"
  protocol          = "${element(var.sg_proto, count.index % var.sg_sg_rules_count)}"
  remote_group_id   = "${element(opentelekomcloud_networking_secgroup_v2.secgroup_test.*.id, var.remote_sg_index[count.index])}"
  security_group_id = "${element(opentelekomcloud_networking_secgroup_v2.secgroup_test.*.id, var.sg_rules_index[count.index])}"

  lifecycle {
    #    prevent_destroy = "true"
  }
}
