### Loadbalancer<br/>
lb_name is the name of the loadbalancer to be deployed
<br/><br/>
lbnetz_index is the index value of the he list(array) of eip deployed. default is 0, when only one eip is deployed
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
cert_id is the id of the certificated generated in OTC in the case of HTTPS, this value is required. HTTP requires no certificate and you can leave it blank e.g. "". This is shown in the values
<br/><br/>
cert_index is the index number if multiple certificates id exist, for proper association with the listeners, default is 0
<br/><br/>
### pool - Backend server groups<br/>
pool_count is the number of pools to be created.
<br/><br/>
pool_name is the name of the server groups created in the enhanced loadbalancer
<br/><br/>
pool protocol is the protocol of the pool created
<br/><br/>
pool_index is the index number of the pool names created, required for association, the pool_index default will be 0.
<br/><br/>
### member<br/>
member_count is the number of backend servers to be associated to the listener. N.B: if 2 Virtual Machines are to be associated to two listeners, The can will be 4. The count is based on the total number of instances to be associated.
<br/><br/>
server_address this is filled in as a list and each IP address of the servers to be associated to the listener. the number of addresses in the server address array should be equivalent to the total number of member count
<br/><br/>
member_index is the index number of the listener where the server should be associated. e.g if only one listener is created, the member_index will be 0
<br/><br/>
server_port is the port number of each of each server to be associated to the pool
<br/><br/>
### Health Check<br/>
The Health check is based on the backend server groups and not each índividual servers  
<br/><br/>
health type  is the protocol of the healthcheck e.g HTTP, TCP
<br/><br/>
health index is the index of the pool resource to be associated to, if only one pool/ backend server group exist the default is 0. index of an array of one
<br/><br/>
### REDIRECT<br/>
The Contents of the Redirect folder should be copied to the same directory as your loadbalancer.
<br/><br/>
redirect count is the number of redirects to be created default is 0, meaning no redirect when count is set to 0.
<br/><br/>
http_index is the index number of the listener with http protocol. Its stored as an array.
<br/><br/>
https_index is the index number of the https protocol to be redirected to, its stored as an array.
