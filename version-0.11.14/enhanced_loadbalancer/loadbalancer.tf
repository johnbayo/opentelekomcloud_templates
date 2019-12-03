resource "opentelekomcloud_lb_loadbalancer_v2" "lb" {
  name           = "${var.lb_name}"
  vip_subnet_id  = "${element(opentelekomcloud_vpc_subnet_v1.subnet.*.subnet_id, var.lbnetz_index)}"
  admin_state_up = 1
}

resource "opentelekomcloud_lb_listener_v2" "listener_resource" {
  count                     = "${var.listener_count}"
  name                      = "${element(var.listener_name, count.index % var.listener_count)}"
  protocol                  = "${element(var.listener_protocol, count.index % var.listener_count)}"
  protocol_port             = "${element(var.listener_port, count.index % var.listener_count)}"
  default_tls_container_ref = "${element(var.cert_id, var.cert_index[count.index])}"
  loadbalancer_id           = "${opentelekomcloud_lb_loadbalancer_v2.lb.id}"
  depends_on                = ["opentelekomcloud_lb_loadbalancer_v2.lb"]
}

resource "opentelekomcloud_lb_pool_v2" "pool_resource" {
  count       = "${var.pool_count}"
  name        = "${element(var.pool_name, count.index % var.listener_count)}"
  protocol    = "${element(var.pool_protocol, count.index % var.listener_count)}"
  lb_method   = "ROUND_ROBIN"
  listener_id = "${element(opentelekomcloud_lb_listener_v2.listener_resource.*.id, var.pool_index[count.index])}"

  persistence {
    type = "HTTP_COOKIE"
  }

  depends_on = ["opentelekomcloud_lb_listener_v2.listener_resource"]
}
