##################################################################
# ecs network interface association
##################################################################
resource "opentelekomcloud_networking_port_v2" "nic_port" {
  count              = "${var.ecs_instance_count}"
  name               = "nic_port"
  network_id         = "${element(opentelekomcloud_vpc_subnet_v1.subnet.*.id, var.nic_index[count.index])}"
  security_group_ids = ["${element(opentelekomcloud_networking_secgroup_v2.sg_test.*.id, var.ecs_sg_index[count.index])}"]
  admin_state_up     = "${var.nic_state}"

  fixed_ip {
    subnet_id  = "${element(opentelekomcloud_vpc_subnet_v1.subnet.*.subnet_id, var.nic_index[count.index])}"
    ip_address = "${element(var.ecs_nic_privat_ip, count.index % var.ecs_instance_count)}"
  }

  depends_on = ["opentelekomcloud_vpc_subnet_v1.subnet"]
}
##############################################
# ecs subnet association
##############################################
variable "ecs_nic_privat_ip" {
  description = "the private ip associated with the NIC from the subnet"
  type        = "list"
}

variable "nic_index" {
  description = "the instance index for the ip association"
  type        = "list"
}

variable "ecs_sg_index" {
  description = "the security group index for the nic association"
  type        = "list"
}

variable "nic_state" {
  description = "the state of the nic"
}
