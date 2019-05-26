##############################################
# rds
##############################################
#data block
#datastore_name can be PostgreSQL or MySQL
datastore_name = ["PostgreSQL", "MySQL"]
datastore_version = ["9.6.10", "5.7.23"]
rds_count = "2"
rds_flavor_index = ["0", "1"]
rds_spec = ["rds.pg.s1.medium.ha","rds.mysql.s1.medium.ha"]
rds_name = ["xxxxxxxxxxxx","xxxxxxxxxxxxx"]
# COMMON / ULTRA-HIGH
rds_vol_type = ["ULTRAHIGH","ULTRAHIGH"]
rds_vol_size = ["40","40"]
rds_netz_index = ["3", "3"]
rds_zone = ["eu-de-02","eu-de-02"]
rds_port = ["xxxx","xxxx"]
rds_backup_time = ["01:00:00", "01:00:00"]
rds_backup_keep_days = ["30", "30"]
rds_root_password = ["xxxxxxxxxxxxx","xxxxxxxxxxxx"]
#for mysql the following options are available
#for psql the following options are available
ha_enable = "true"
#for mysql - async /semisync
#for psql - async/sync
ha_replication = ["async", "async"]
