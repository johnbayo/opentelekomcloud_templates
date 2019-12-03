##############################################
# security group
##############################################
sg_name = ["xxxxx-xxx", "xxxxxx-xxx", "xxxxxx-engine", "xxxxxx-xxx", "xxxx-test"]
sg_count = "5"

ip_sg_rules_count = "9"
ip_lower_port = ["22","8635","5432","80","443","9923","80","443","22","8635","80","443","22"]
ip_upper_port = ["22","8635","5432","80","443","9923","80","443","22","8635","80","443","22"]
ip_range = ["xxxxx","0.0.0.0/0","0.0.0.0/0","0.0.0.0/0","0.0.0.0/0","0.0.0.0/0","0.0.0.0/0","0.0.0.0/0","0.0.0.0/0"]
ip_proto = ["tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp"]
ip_rules_index = ["0","0","0","1","1","1","2","2","2"]

sg_sg_rules_count = "4"
sg_lower_port = ["22","8635","5432","80"]
sg_upper_port = ["22","8635","5432","80"]
sg_proto = ["tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp","tcp"]
remote_sg_index = ["3","3","4","4"]
sg_rules_index = ["3","4","4","4"]
