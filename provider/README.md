### Provider<br/>
This template will authenticate Terraform in OTC with the function user or credentials as required by you
<br/><br/>
user_name is for the required username
<br/><br/>
password is for the required password
<br/><br/>
access_key is not required if you are using username and password. Required for creating an OBS bucket and uploading object in OBS. At the time of this README, not supported by Terraform for authentication, with a remote tfstate file (tfstate in OBS bucket)
<br/><br/>
secret_key is not required if you are using username and password. Required for creating an OBS bucket and uploading object in OBS. At the time of this README, not supported by Terraform for authentication, with a remote tfstate file (tfstate in OBS bucket)
<br/><br/>
tenant_name is the region_projectname except if the infrastructure is not deployed in a specific project
<br/><br/>
domain__name is the domain id
<br/><br/>
auth_url is the url, defaults to https://iam.eu-de.otc.t-systems.com:443/v3
<br/><br/>
region is eu-de at the moment only available
