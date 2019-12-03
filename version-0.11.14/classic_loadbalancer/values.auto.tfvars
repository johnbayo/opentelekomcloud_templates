#############################################
# Loadbalancer 
##############################################
lb_name = "lb-xxxxxxx"
lb_bandwidth = "5"
eip_index = "0"
listener_count = "1"
listener_name = ["listener-80","listener-443"]
listener_protocol = ["HTTP","HTTPS"]
listener_port = ["80","443"]
backend_protocol = ["HTTP","HTTP"]
backend_port = ["80","8081"]
cert_id = ["",""]
cert_index = ["0","1"]
backend_count = "2"
server_address = ["",""]
backend_index = ["0","1","2","3"]
health_protocol = ["HTTP","HTTP"]
health_port = ["80","8081"]
