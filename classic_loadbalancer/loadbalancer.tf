resource "opentelekomcloud_elb_loadbalancer" "test_elb" {
  name           = "${var.lb_name}"
  type           = "External"
  vip_address    = "${element(opentelekomcloud_vpc_eip_v1.eip_resource.*.publicip.0.ip_address, var.eip_index)}"
  vpc_id         = "${opentelekomcloud_vpc_v1.vpc.id}"
  admin_state_up = 1
  bandwidth      = "${var.lb_bandwidth}"
}

resource "opentelekomcloud_elb_listener" "listener" {
  count            = "${var.listener_count}"
  name             = "${element(var.listener_name, count.index % var.listener_count)}"
  protocol         = "${element(var.listener_protocol, count.index % var.listener_count)}"
  protocol_port    = "${element(var.listener_port, count.index % var.listener_count)}"
  backend_protocol = "${element(var.backend_protocol, count.index % var.listener_count)}"
  backend_port     = "${element(var.backend_port, count.index % var.listener_count)}"
  certificate_id   = "${element(var.cert_id, var.cert_index[count.index])}"
  lb_algorithm     = "roundrobin"
  loadbalancer_id  = "${opentelekomcloud_elb_loadbalancer.test_elb.id}"

  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }

  depends_on = ["opentelekomcloud_elb_loadbalancer.test_elb"]
}

resource "opentelekomcloud_elb_backend" "backend" {
  count       = "${var.backend_count}"
  address     = "${element(var.server_address, count.index % var.backend_count)}"
  listener_id = "${element(opentelekomcloud_elb_listener.listener.*.id, var.backend_index[count.index])}"
  server_id   = "${element(opentelekomcloud_compute_instance_v2.ec2_instance.*.id, var.backend_index[count.index])}"
  depends_on  = ["opentelekomcloud_elb_listener.listener"]
}

resource "opentelekomcloud_elb_health" "healthcheck" {
  count       = "${var.backend_count}"
  listener_id = "${element(opentelekomcloud_elb_listener.listener.*.id, var.backend_index[count.index])}"
  healthcheck_protocol = "${element(var.health_protocol, count.index % var.backend_count)}"
  healthcheck_connect_port = "${element(var.health_port, count.index % var.backend_count)}" 
  healthy_threshold = 5
  healthcheck_timeout = 25
  healthcheck_interval = 3
  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }
  depends_on  = ["opentelekomcloud_elb_backend.backend"]
}
