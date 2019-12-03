##############################################
# Boot Volume
##############################################
data "opentelekomcloud_images_image_v2" "resource_images" {
  count = "${var.image_count}"
  name  = "${element(var.image_name, count.index % var.image_count)}"
}

resource "opentelekomcloud_blockstorage_volume_v2" "bootvol" {
  count             = "${var.root_volume_image_count}"
  name              = "${element(var.ecs_name, count.index % var.root_volume_image_count)}-bootdisk"
  size              = "${element(var.boot_volume_size, count.index % var.root_volume_image_count)}"
  volume_type       = "${element(var.boot_volume_type, count.index % var.root_volume_image_count)}"
  image_id          = "${element(data.opentelekomcloud_images_image_v2.resource_images.*.id, var.root_volume_image_id[count.index])}"
  availability_zone = "${element(var.az_zone, count.index % var.root_volume_image_count)}"

  lifecycle = {
    ignore_changes = ["image_id"]
  }

}
