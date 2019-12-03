### Security Groups  <br/>
This template will deploy multiple security groups
<br/><br/>
sg_name is the name of the security groups to be deployed
<br/><br/>
sg_count is the number of security groups to be deployed
<br/><br/>
### Inbound rules for IPaddress  <br/>
ip_sg_rules_count is the number of inbound rules to be allowed in the desired securtiy group based on ipaddresses
<br/><br/>
ip_lower_port is the minimum range for the port to be open e.g 8080-8084, i.e. 8080 should be passed here
<br/><br/>
ip_upper_port is the maximum range for the port to be open e.g as above 8084 should be passed here
<br/><br/>
ip_range is the ip address or network block to enable access in the security group
<br/><br/>
ip_rules_index is the index value of the security group for association in sg_name
<br/><br/>
### Inbound rules for Security Groups  <br/>
sg_sg_rules_count is the number of inbound rules to be allowed in the desired security group based on security groups
<br/><br/>
sg_lower_port is the minimum range for the port to be open e.g 8080-8084, i.e. 8080 should be passed here
<br/><br/>
sg_upper_port is the maximum range for the port to be open e.g as above 8084 should be passed here
<br/><br/>
remote_sg_index is the index value of the remote security group to be associated with the desired current security group configured
<br/><br/>
sg_rules_index is the index value of the current security group configured
