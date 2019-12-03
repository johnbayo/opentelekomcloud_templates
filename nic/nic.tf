##################################################################
# subnet association
##################################################################
resource "opentelekomcloud_networking_port_v2" "admin_port" {
  count              = "${var.ecs_instance_count}"
  name               = "admin_port"
  network_id         = "${element(opentelekomcloud_vpc_subnet_v1.subnet.*.id, var.admin_index[count.index])}"
  security_group_ids = ["${element(opentelekomcloud_networking_secgroup_v2.secgroup_test.*.id, var.ecs_sg_index[count.index])}"]
  admin_state_up     = "${var.nic_state}"

  fixed_ip {
    subnet_id  = "${element(opentelekomcloud_vpc_subnet_v1.subnet.*.subnet_id, var.admin_index[count.index])}"
    ip_address = "${element(var.ecs_admin_private_ip, count.index % var.ecs_instance_count)}"
  }

  depends_on = ["opentelekomcloud_vpc_subnet_v1.subnet"]
}
