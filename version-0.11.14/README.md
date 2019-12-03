#  Generic Terraform Templates

Valid for Terraform version 0.11.14

## parameters:

Some parameters have the type string - that means they have a single value.

Most of the parameters have the type list - that means they form an array and can have multiple values. 

For example, if you want to create 3 eip's, 
then the parameter is eip_count = 3 while the other parameters must have 3 values like this:

bandwidth_name  = ["eip1","eip2","eip3"]

the first values would be assigned to one eip, 

the second values would be assigned to the second eip 

and the third values would be assigned to the third eip.

You can handle this with as many values as you like. This mechanism is repeated in many templates.
