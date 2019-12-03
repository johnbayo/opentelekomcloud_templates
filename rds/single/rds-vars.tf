##############################################
# RDS 
##############################################
variable "rds_count" {
  description = "number of rds instance to be installed"
}

variable "rds_flavor" {
  description = "index of the flavor, important for flavor id association in the rds"
  type        = "list"
}

variable "rds_zone" {
  description = "zone in which the database should be installed"
  type        = "list"
}

variable "rds_name" {
  description = "custom name of the database e.g rds-test"
  type        = "list"
}

variable "rds_sg_index" {
  description = "required for the subnet association"
  type        = "list"
}

variable "rds_netz_index" {
  description = "required for the subnet association"
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

variable "rds_root_password" {
  description = "root passowrd of the database"
  type        = "list"
}

variable "db_type" {
  description = "Custom or default port number of the database instance"
  type        = "list"
}

variable "db_version" {
  description = "Custom or default port number of the database instance"
  type        = "list"
}

variable "db_port" {
  description = "Custom or default port number of the database instance"
  type        = "list"
}

variable "rds_backup_time" {
  description = "time the backup should be started daily"
  type        = "list"
}

variable "rds_kms_index" {
  description = "the index of the kms key"
  type        = "list"
}

variable "rds_backup_keep_days" {
  description = "number of days backup should be kept"
  type        = "list"
}
