resource "opentelekomcloud_sfs_file_system_v2" "share_test" {
  count             = "${var.sfs_count}"
  region            = "eu-de"
  availability_zone = "${element(var.sfs_az, count.index % var.sfs_count)}"
  size              = "${element(var.sfs_size, count.index % var.sfs_count)}"
  name              = "${element(var.sfs_name, count.index % var.sfs_count)}"
  access_to         = "${format("${opentelekomcloud_vpc_v1.vpc.id}%s#0#no_all_squash,no_root_squash", "#${element(var.sfs_ip_range, count.index % var.sfs_count)}")}"
  access_level      = "${element(var.sfs_access_level, count.index % var.sfs_count)}"

  metadata = {
    "type"                 = "nfs"
    "#sfs_crypt_domain_id" = "${var.domain_name}"
    "#sfs_crypt_alias"     = "${element(var.resource_key, var.sfs_keyindex[count.index])}"
    "#sfs_crypt_key_id"    = "${element(opentelekomcloud_kms_key_v1.resourcekey.*.id, var.sfs_keyindex[count.index])}"
  }

  lifecycle {
    ignore_changes = ["availability_zone", "metadata"]
  }

  depends_on = ["opentelekomcloud_vpc_v1.vpc"]
}
