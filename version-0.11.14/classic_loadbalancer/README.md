### Loadbalancer<br/>
lb_name is the name of the loadbalancer to be deployed
<br/><br/>
eip_index is the index value of the eip in the list(array) of eip deployed. default is 0, when only one eip is deployed
<br/><br/>
lb_bandwidth is the bandwith of the loadbalancer
<br/><br/>
### Listener<br/>
listener__count is the number of listeners to deployed in the loadbalancer
<br/><br/>
listener_name is the name of each listeners to be deployed
<br/><br/>
listener_protocol is the protocol of each listener to be deployed, it must be filled up sequentially as a list like the listener name in the values file
<br/><br/>
listener_port is the port number of each protocol filled as above
<br/><br/>
backend_protocol is the protocol of the backend servers
<br/><br/>
backend_port is the port number of each backend_protocol filled up
<br/><br/>
certificate_id is the id of the certificated generated in OTC in the case of HTTPS, this value is required. HTTP requires no certificate and you can leave it blank e.g. "". This is shown in the values
<br/><br/>
### Backend - server association in listeners<br/>
backend_count is the number of backend servers to be associated to the listener. N.B: if 2 Virtual Machines are to be associated to two listeners, The count will be 4. The count is based on the total number of instances to be associated.
<br/><br/>
server_address this is filled in as a list and each IP address of the servers to be associated to the listener. the number of addresses in the server address array should be equivalent to the total number of backend count
<br/><br/>
backend_index is the index number of the listener where the server should be associated. e.g if only one listener is created, the backend_index will be 0
<br/><br/>
### Healthcheck<br/>
health protocol is the protocol of the healthcheck e.g HTTP, TCP
<br/><br/>
health port is the port number the health check should be on
