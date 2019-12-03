resource "tls_private_key" "temp_private_key" {
  algorithm = "RSA"
}

resource "opentelekomcloud_compute_keypair_v2" "letsencryptkeypair" {
  name       = "temp-ssh-encrypt"
  public_key = "${tls_private_key.temp_private_key.public_key_openssh}"
}

resource "opentelekomcloud_vpc_eip_v1" "temp_eip_letsencrypt" {
  publicip {
    type = "5_bgp"
  }

  bandwidth {
    name        = "temp-eip-letsencrypt"
    size        = 5
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

resource "opentelekomcloud_networking_secgroup_v2" "temp_secgroup" {
  name = "sg-temp-letsencrypt"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "temp_letsencrypt_sg" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.temp_secgroup.id}"
}

resource "opentelekomcloud_vpc_v1" "vpc_temp_letsencrypt" {
  name = "vpc_temp_letsencrypt"
  cidr = "10.0.0.0/26"
}

resource "opentelekomcloud_vpc_subnet_v1" "subnet_temp_letsencrypt" {
  name          = "subnet_temp_letsencrypt"
  cidr          = "10.0.0.0/28"
  gateway_ip    = "10.0.0.1"
  vpc_id        = "${opentelekomcloud_vpc_v1.vpc_temp_letsencrypt.id}"
  primary_dns   = "8.8.8.8"
  secondary_dns = "8.8.4.4"
}

resource "opentelekomcloud_compute_instance_v2" "temp_letsencrypt" {
  name            = "temp-letsencrypt"
  image_name      = "Standard_CentOS_7_latest"
  flavor_name     = "s2.medium.1"
  key_pair        = "temp-ssh-encrypt"
  security_groups = ["${opentelekomcloud_networking_secgroup_v2.temp_secgroup.id}"]

  network {
    uuid = "${opentelekomcloud_vpc_subnet_v1.subnet_temp_letsencrypt.id}"
  }

  depends_on = ["opentelekomcloud_networking_secgroup_v2.temp_secgroup", "opentelekomcloud_compute_keypair_v2.letsencryptkeypair", "opentelekomcloud_vpc_subnet_v1.subnet_temp_letsencrypt"]
}

resource "opentelekomcloud_compute_floatingip_associate_v2" "fip_associate_letsencrypt" {
  floating_ip = "${opentelekomcloud_vpc_eip_v1.temp_eip_letsencrypt.publicip.0.ip_address}"
  instance_id = "${opentelekomcloud_compute_instance_v2.temp_letsencrypt.id}"
}
