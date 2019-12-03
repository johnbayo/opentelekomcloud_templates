#############################################
# rds
##############################################
rds_name = ["test-postgre","test-mysql"]
rds_count = "2"
rds_zone = ["eu-de-01","eu-de-02"]
rds_flavor = ["rds.pg.c2.medium","rds.mysql.c2.medium"]
rds_sg_index = ["2", "2"]
rds_netz_index = ["2", "2"]
# COMMON / ULTRA-HIGH
rds_kms_index = ["2", "2"]
rds_vol_type = ["ULTRAHIGH","ULTRAHIGH"]
rds_vol_size = ["40","40"]
# database spec 
rds_root_password = ["suu7aJipeisorohm","xxxxxxxxxxxxxxxx"]
db_type = ["PostgreSQL","MySQL"]
db_port = ["5432","3306"]
db_version = ["10.0","5.7"]
# backup time 
rds_backup_time = ["07:00-02:00", "08:00-02:00"]
rds_backup_keep_days = ["30", "30"]
