##########################################################################
# associating instances with the loadbalancer
##########################################################################

resource "opentelekomcloud_elb_backend" "backend" {
  count       = "${var.backend_count}"
  address     = "${element(var.server_address, count.index % var.backend_count)}"
  listener_id = "${element(opentelekomcloud_elb_listener.listener.*.id, var.backend_index[count.index])}"
  server_id   = "${element(opentelekomcloud_compute_instance_v2.ec2_instance.*.id, var.backend_index[count.index])}"
  depends_on  = ["opentelekomcloud_elb_listener.listener","opentelekomcloud_cce_cluster_v3.cluster_resource","opentelekomcloud_compute_instance_v2.ec2_instance"]
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
