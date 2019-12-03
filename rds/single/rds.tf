##################################################################
# RDS instance
##################################################################
resource "opentelekomcloud_rds_instance_v3" "rds_resource" {
  name              = "${element(var.rds_name, count.index % var.rds_count)}"
  count             = "${var.rds_count}"
  availability_zone = ["${var.rds_zone[count.index]}"]
  security_group_id = "${element(opentelekomcloud_networking_secgroup_v2.secgroup_test.*.id,  var.rds_sg_index[count.index])}"
  vpc_id            = "${opentelekomcloud_vpc_v1.vpc.id}"
  subnet_id         = "${element(opentelekomcloud_vpc_subnet_v1.subnet.*.id, var.rds_netz_index[count.index])}"
  flavor            = "${element(var.rds_flavor, count.index % var.rds_count)}"

  ##########################
  # voltype and size       #
  ##########################
  volume {
    disk_encryption_id = "${element(opentelekomcloud_kms_key_v1.resourcekey.*.id, var.rds_kms_index[count.index])}"
    type               = "${element(var.rds_vol_type, count.index % var.rds_count)}"
    size               = "${element(var.rds_vol_size, count.index % var.rds_count)}"
  }

  ##########################
  # database Specification #
  ##########################
  db = {
    password = "${element(var.rds_root_password, count.index % var.rds_count)}"
    type     = "${element(var.db_type, count.index % var.rds_count)}"
    version  = "${element(var.db_version, count.index % var.rds_count)}"
    port     = "${element(var.db_port, count.index % var.rds_count)}"
  }

  ##########################
  # backup strategy        #
  ##########################
  backup_strategy = {
    start_time = "${element(var.rds_backup_time, count.index % var.rds_count)}"
    keep_days  = "${element(var.rds_backup_keep_days, count.index % var.rds_count)}"
  }

  depends_on = ["opentelekomcloud_networking_secgroup_v2.secgroup_test", "opentelekomcloud_vpc_subnet_v1.subnet"]
}
