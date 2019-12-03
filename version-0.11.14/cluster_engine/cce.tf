##################################################################
# Container Cluster
##################################################################
#https://docs.otc.t-systems.com/en-us/api2/cce/cce_02_0236.html
#API Reference 2.0 ->API->Cluster Management
#for the values of the keys
# flavor_id in cluster_resource cce.s2.small: small-scale HA cluster (up to 50 nodes)

resource "opentelekomcloud_cce_cluster_v3" "cluster_resource" {
  count                  = "${var.cluster_count}"
  name                   = "${element(var.cluster_name, count.index % var.cluster_count)}"
  cluster_type           = "VirtualMachine"
  flavor_id              = "${element(var.cluster_flavor, count.index % var.cluster_count)}"
  vpc_id                 = "${opentelekomcloud_vpc_v1.vpc.id}"
  subnet_id              = "${element(opentelekomcloud_vpc_subnet_v1.subnet.*.id, element(var.cluster_subnet_index, count.index % var.cluster_count))}"
  container_network_type = "${element(var.cluster_con_netz_typ, count.index % var.cluster_count)}"
#  description            = ""
  cluster_version        = "${element(var.cluster_version, count.index % var.cluster_count)}"

  timeouts {
    create = "30m"
    delete = "45m"
  }
}
