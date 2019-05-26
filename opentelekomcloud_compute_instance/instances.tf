##################################################################
# ECS Instance
##################################################################
resource "opentelekomcloud_compute_instance_v2" "ec2_instance" {
  count             = "${var.ecs_instance_count}"
  name              = "${element(var.ecs_name, count.index % var.ecs_instance_count)}"
  flavor_name       = "${element(var.ecs_flavor_name, count.index % var.ecs_instance_count)}"
  key_pair          = "${opentelekomcloud_compute_keypair_v2.keypair.name}"
  user_data         = "${file(var.user_data_path[count.index])}"
  availability_zone = "${element(var.az_zone, count.index % var.ecs_instance_count)}"

  block_device {
    uuid                  = "${opentelekomcloud_blockstorage_volume_v2.bootvol.*.id[count.index]}"
    source_type           = "volume"
    destination_type      = "volume"
    volume_size           = "${var.boot_volume_size[count.index]}"
    boot_index            = "0"
    delete_on_termination = true
  }

  ##################################################################
  # subnet association definition
  ##################################################################
  network {
    port           = "${element(opentelekomcloud_networking_port_v2.nic_port.*.id, count.index % var.ecs_instance_count)}"
    access_network = true
  }

  lifecycle = {
    ignore_changes = ["security_groups", "user_data", "keypair"]
  }

  depends_on = ["opentelekomcloud_blockstorage_volume_v2.bootvol", "opentelekomcloud_networking_port_v2.nic_port"]
}

##################################################################
# for more than two nic, please duplicate the network block to the desired number as shown above
##################################################################

##############################################
# ECS Instance    
##############################################
variable "ecs_name" {
  description = "name of the ecs instance"
  type        = "list"
}

variable "az_zone" {
  description = "the availability zone the instance should be deployed to"
  type        = "list"
}

variable "ecs_flavor_name" {
  description = "the flavor of the machine"
  type        = "list"
}

variable "sshkeyname" {
  description = "the custom name to be assigned ssh key file"
}

variable "ssh_pub_key" {
  description = "path of the initial public key to be uploaded"
}

variable "user_data_path" {
  description = "path of the user data configuration to be deployed on the instance"
  type        = "list"
}

variable "ecs_instance_count" {
  description = "number of ecs instance to be deployed"
}
