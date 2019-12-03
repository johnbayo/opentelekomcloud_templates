### Node Cluster<br/>
This template will created as many node cluster for the desired master node.
<br/><br/>
node_count is the number of node clusters to be created
<br/><br/>
node_name is the name of each individual node clusters
<br/><br/>
flavor_id is the name of the flavor, please see OTC documentation
<br/><br/>
cluster_index is the index value of the master node the nodes should be associated with. i.e. if only one master node is created, the index value will be 0
<br/><br/>
node_az is the availability zone of each nodes.
<br/><br/>
N.B: dependent on cluster engine and keypair if ssh should be accessible on the nodes
