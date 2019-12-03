##############################################
# Loadbalancer 
##############################################
#lb_count = "1"
lb_name = "xxxxxxxxxxxx"
lbnetz_index = "2"
###################################
listener_count = "3"
listener_name = ["xxxx-80","xxxx-8080","xxx-443"]
listener_protocol = ["HTTP","TCP","TERMINATED_HTTPS"]
listener_port = ["80","8080","443"]
cert_id = ["","","xxxxxxxxxxxx"]
cert_index = ["0","1","2"]
###################################
pool_count = "2"
pool_name = ["pool-xxxxx","pool-xxxx"]
pool_protocol = ["HTTP","TCP"]
pool_index = ["1","2"]
###################################
member_count = "4"
server_address = ["","","",""]
member_index = ["0","0","1","1"]
server_port = ["8080","8080","30080","30080"]
###################################
health_type = ["TCP","TCP"]
health_index = ["0","1"]
