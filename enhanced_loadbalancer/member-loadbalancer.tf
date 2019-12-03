#################################################################
# Associating the loadbalancer with Health Checks
################################################################
resource "opentelekomcloud_lb_member_v2" "member" {
  count         = "${var.member_count}"
  address       = "${element(var.server_address, count.index % var.member_count)}"
  pool_id       = "${element(opentelekomcloud_lb_pool_v2.pool_resource.*.id, var.member_index[count.index])}"
  subnet_id     = "${element(opentelekomcloud_vpc_subnet_v1.subnet.*.subnet_id, var.member_subnet_index[count.index])}"
  protocol_port = "${element(var.server_port, count.index % var.member_count)}"
}

resource "opentelekomcloud_lb_monitor_v2" "monitor_resource" {
  count       = "${var.pool_count}"
  pool_id     = "${element(opentelekomcloud_lb_pool_v2.pool_resource.*.id, var.health_index[count.index])}"
  type        = "${element(var.health_type, count.index % var.member_count)}"
  delay       = 5
  timeout     = 10
  max_retries = 3
  depends_on  = ["opentelekomcloud_lb_member_v2.member"]
}
