##################################################################
# Node Cluster
##################################################################
resource "opentelekomcloud_cce_node_v3" "node_cluster" {
  cluster_id        = "${element(opentelekomcloud_cce_cluster_v3.cluster_resource.*.id, var.clusterindex[count.index])}"
  count             = "${var.node_count}"
  name              = "${element(var.node_name, count.index % var.node_count)}"
  flavor_id         = "${element(var.node_flavor, count.index % var.node_count)}"
  availability_zone = "${element(var.node_az, count.index % var.node_count)}"
  key_pair          = "${element(var.sshkeyname,count.index % var.node_count)}"

  root_volume = {
    size = "${element(var.node_root_vol_size, count.index)}"

    volumetype = "${element(var.node_root_vol_typ, count.index)}"
  }

  data_volumes = [{
    size = "${element(var.node_data_vol_size, count.index)}"

    volumetype = "${element(var.node_data_vol_typ, count.index)}"
  }]

  timeouts {
    create = "15m"
    delete = "45m"
  }
}
