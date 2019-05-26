##################################################################
# importing the flavor from otc 
##################################################################
data "opentelekomcloud_rds_flavors_v1" "flavor" {
  region            = "eu-de"
  count             = "${var.rds_count}"
  datastore_name    = "${element(var.datastore_name, count.index % var.rds_count)}"
  datastore_version = "${element(var.datastore_version, count.index % var.rds_count)}"
  speccode          = "${element(var.rds_spec, count.index % var.rds_count)}"
}

##################################################################
# RDS instance
##################################################################
resource "opentelekomcloud_rds_instance_v1" "rds_resource" {
  name  = "${element(var.rds_name, count.index % var.rds_count)}"
  count = "${var.rds_count}"

  ##########################
  # flavor imported        #
  ##########################
  datastore {
    type    = "${element(var.datastore_name, count.index % var.rds_count)}"
    version = "${element(var.datastore_version, count.index % var.rds_count)}"
  }

  flavorref = "${element(data.opentelekomcloud_rds_flavors_v1.flavor.*.id, var.rds_flavor_index[count.index])}"

  ##########################
  # voltype and size       #
  ##########################
  volume {
    type = "${element(var.rds_vol_type, count.index % var.rds_count)}"
    size = "${element(var.rds_vol_size, count.index % var.rds_count)}"
  }

  ##########################
  # Network Conf           #
  ##########################
  region = "eu-de"

  availabilityzone = "${element(var.rds_zone, count.index % var.rds_count)}"
  vpc              = "${opentelekomcloud_vpc_v1.vpc.id}"

  nics {
    subnetid = "${element(opentelekomcloud_vpc_subnet_v1.subnet.*.id, var.rds_netz_index[count.index])}"
  }

  securitygroup {
    id = "${element(opentelekomcloud_networking_secgroup_v2.secgroup_coc.*.id, 3)}"
  }

  ##########################
  # database port          #
  ##########################
  dbport = "${element(var.rds_port, count.index % var.rds_count)}"

  ##########################
  # backup strategy        #
  ##########################
  backupstrategy = {
    starttime = "${element(var.rds_backup_time, count.index % var.rds_count)}"
    keepdays  = "${element(var.rds_backup_keep_days, count.index % var.rds_count)}"
  }

  ##########################
  # password & ha          #
  ##########################
  dbrtpd = "${element(var.rds_root_password, count.index % var.rds_count)}"

  ha = {
    enable          = "${var.ha_enable}"
    replicationmode = "${element(var.ha_replication, count.index % var.rds_count)}"
  }

  timeouts {
    create = "15m"
    delete = "30m"
  }

  depends_on = ["opentelekomcloud_networking_secgroup_v2.secgroup_coc"]
}
##############################################
# rds
##############################################
variable "datastore_name" {
  description = "type of database required"
  type        = "list"
}

variable "datastore_version" {
  description = " version of the database"
  type        = "list"
}

variable "rds_count" {
  description = "number of rds instance to be installed"
}

variable "rds_spec" {
  description = "specification of the rds paas instance"
  type        = "list"
}

variable "rds_flavor_index" {
  description = "index of the flavor, important for flavor id association in the rds"
  type        = "list"
}

variable "rds_name" {
  description = "custom name of the database e.g rds-test"
  type        = "list"
}

variable "rds_vol_type" {
  description = "SATA or SSD"
  type        = "list"
}

variable "rds_vol_size" {
  description = "size of the root volume, minimum is 40gb"
  type        = "list"
}

variable "rds_zone" {
  description = "zone in which the database should be installed"
  type        = "list"
}

variable "rds_netz_index" {
  description = "required for the subnet association"
  type        = "list"
}

variable "rds_port" {
  description = "Custom or default port number of the database instance"
  type        = "list"
}

variable "rds_backup_time" {
  description = "time the backup should be started daily"
  type        = "list"
}

variable "rds_backup_keep_days" {
  description = "number of days backup should be kept"
  type        = "list"
}

variable "rds_root_password" {
  description = "root passowrd of the database"
  type        = "list"
}

variable "ha_enable" {
  description = "describes if ha should be enabled or not"
}

variable "ha_replication" {
  description = "the mode of the replication"
  type        = "list"
}
