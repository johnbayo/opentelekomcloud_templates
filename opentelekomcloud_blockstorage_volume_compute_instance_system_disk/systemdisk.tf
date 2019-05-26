##############################################
# Boot Volume
##############################################
data "opentelekomcloud_images_image_v2" "instance_image" {
  count = "${var.image_count}"
  name  = "${element(var.image_name, count.index % var.image_count)}"
}

resource "opentelekomcloud_blockstorage_volume_v2" "bootvol" {
  count             = "${var.root_volume_image_count}"
  name              = "${element(var.ecs_name, count.index % var.root_volume_image_count)}-bootdisk"
  size              = "${element(var.boot_volume_size, count.index % var.root_volume_image_count)}"
  volume_type       = "${element(var.boot_volume_type, count.index % var.root_volume_image_count)}"
  image_id          = "${element(data.opentelekomcloud_images_image_v2.instance_image.*.id, var.root_volume_image_id[count.index])}"
  availability_zone = "${element(var.az_zone, count.index % var.root_volume_image_count)}"

  lifecycle = {
    ignore_changes = ["image_id"]
  }

}
##############################################
# system disk
##############################################
variable "image_name" {
  type        = "list"
  description = "The name of the images to be used as System 'root' volume"
}

variable "image_count" {
  description = "The number of images to be deployed"
}

variable "root_volume_image_count" {
  description = "can also be the ecs_count, depends on the number of server to be deployed. Each server needs an image"
}

variable "root_volume_image_id" {
  type        = "list"
  description = "the id of the instance image imported from the instance_image data source"
}

variable "boot_volume_size" {
  type        = "list"
  description = "System 'root' volume size for servers."
}

variable "boot_volume_type" {
  type        = "list"
  description = "System 'root' volume type for servers."
}
