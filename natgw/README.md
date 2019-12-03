### NAT GW & rules<br/>
This template will create NAT GWs as desired.
<br/><br/>
natgw_count is the desired count of nat gateways
<br/><br/>
natgw_name is a list of the desired nat gateways names
<br/><br/>
natgw_subnet_index is the index of the subnet the desired nat gateway should be assigned
<br/><br/>
natgw_rule_count is the number of nat gw rules to implement
<br/><br/>
natgw_rule_eip_index is the index of the eip to use for this nat gw rule
<br/><br/>
natgw_rule_gw_index is the index of the nat gw to attach this rule to
<br/><br/>
natgw_size is the size as stated in variables file
<br/><br/>
**TODO**
modify template for multiple VPCs
