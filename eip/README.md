# generell facts:

this templates creates one or more elastic ip

# parameters:

some parameters have the type text - that means they have a single value.

most of the parameters have the type list - that means they form an array and can have multiple values. 

For example, if you want to create 3 eip's, 
then the parameter is eip_count = 3 while the other parameters must have 3 values like this:

bandwidth_name  = ["eip1","eip2","eip3"]

the first values would be assigned to one eip, 

the second values would be assigned to the second eip 

and the third values would be assigned to the third eip.

you can handle this with as many values as you like.


eip_count		= how much eip's do you need?

--> text

bandwidth_name	= the name of the bandwith object

--> list

eip_size		= the bandwith of the eip (range from 1 - 1000 Mbit/s)

--> list
