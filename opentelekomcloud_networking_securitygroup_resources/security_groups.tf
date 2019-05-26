###################################################################
#  security-groups definition
###################################################################
resource "opentelekomcloud_networking_secgroup_v2" "sg_test" {
  name  = "sg-${element(var.sg_name, count.index)}"
  count = "${var.sg_count}"

  lifecycle {
    #    prevent_destroy = "true"
  }
}

###################################################################
#  security group rules with ip
###################################################################
resource "opentelekomcloud_networking_secgroup_rule_v2" "ip_rules_test" {
  count             = "${var.ip_sg_rules_count}"
  direction         = "ingress"
  port_range_min    = "${element(var.inbound_port, count.index % var.ip_sg_rules_count)}"
  port_range_max    = "${element(var.outbound_port,count.index % var.ip_sg_rules_count)}"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "${element(var.ip_range, count.index % var.ip_sg_rules_count)}"
  security_group_id = "${element(opentelekomcloud_networking_secgroup_v2.sg_test.*.id, var.ip_rules_index[count.index])}"

  lifecycle {
    #    prevent_destroy = "true"
  }
}

###################################################################
#  security group rules with security group
###################################################################
resource "opentelekomcloud_networking_secgroup_rule_v2" "sg_rules_test" {
  count             = "${var.sg_sg_rules_count}"
  direction         = "ingress"
  port_range_min    = "${element(var.inbound_port, var.ip_sg_rules_count + count.index % var.sg_sg_rules_count)}"
  port_range_max    = "${element(var.outbound_port, var.ip_sg_rules_count + count.index % var.sg_sg_rules_count)}"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_group_id   = "${element(opentelekomcloud_networking_secgroup_v2.sg_test.*.id, var.sg_rules_index[count.index])}"
  security_group_id = "${element(opentelekomcloud_networking_secgroup_v2.sg_test.*.id, var.sg_rules_index[count.index])}"

  lifecycle {
    #    prevent_destroy = "true"
  }
}
##############################################
# security-group
##############################################
variable "sg_name" {
  description = "security group name"
  type        = "list"
}

variable "sg_count" {
  description = "number of security groups"
}

############################
variable "ip_sg_rules_count" {
  description = "number of security groups with ip address rules"
}

variable "sg_sg_rules_count" {
  description = "number of security groups with other security group rules"
}

variable "inbound_port" {
  description = "security group inbound port"
  type        = "list"
}

variable "outbound_port" {
  description = "security group outbound port"
  type        = "list"
}

variable "ip_range" {
  description = "the ip range"
  type        = "list"
}

variable "ip_rules_index" {
  description = "the index for associating the security group with its ip rules"
  type        = "list"
}

variable "sg_rules_index" {
  description = "the index for associating the security group with its security group rules"
  type        = "list"
}
