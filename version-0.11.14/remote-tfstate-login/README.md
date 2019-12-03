###  Remote tfstate Provider Authentication <br/>
This template will authenticate Terraform in OTC with the function user or credentials as required by you with your tfstate file stored in a remote obs bucket
<br/><br/>
user_name is for the required username
<br/><br/>
password is for the required password
<br/><br/>
tenant_name is the region_projectname except if the infrastructure is not deployed in a specific project
<br/><br/>
domain__name is the domain id
<br/><br/>
auth_url is the url, defaults to https://iam.eu-de.otc.t-systems.com:443/v3
<br/><br/>
container value is the name of the object in the obs bucket
<br/><br/>
key is the kmskey for the object in OBS
<br/><br/>
<pre>
terraform init -backend-config=credentials.auto.tfvars
terraform plan
terraform apply
</pre>
