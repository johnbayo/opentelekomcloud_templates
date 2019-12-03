##################################################################
# Data Volume
##################################################################
resource "opentelekomcloud_blockstorage_volume_v2" "datavol" {
  count             = "${var.data_volume_count}"
  name              = "${element(var.data_name, count.index % var.data_volume_count)}-datadisk"
  size              = "${element(var.data_volume_size, count.index % var.data_volume_count)}"
  volume_type       = "${element(var.data_volume_type, count.index % var.data_volume_count)}"
  availability_zone = "${element(var.az_zone, count.index % var.data_volume_count)}"

  metadata {
    __system__encrypted = "1"
    __system__cmkid     = "${element(opentelekomcloud_kms_key_v1.resourcekey.*.id, var.data_keyindex[count.index])}"
  }

  lifecycle {
    ignore_changes = ["metadata"]
  }
}

##################################################################
# Attachment of Compute Volume
##################################################################
resource "opentelekomcloud_compute_volume_attach_v2" "attachments" {
  count = "${var.data_volume_count}"
  instance_id = "${element(opentelekomcloud_compute_instance_v2.ec2_instance.*.id, var.data_instance_index[count.index])}"
  volume_id   = "${element(opentelekomcloud_blockstorage_volume_v2.datavol.*.id, var.dataindex[count.index])}"
  depends_on  = ["opentelekomcloud_blockstorage_volume_v2.datavol"]
}
