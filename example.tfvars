###########################################
# Brock Palen
# brockp@umich.edu
# http://arc-ts.umich.edu/

################
##
#  Example tfvars file, you can change any variable in inputs.tf here

###############################################################################
## Jetstream VM options

# number of VM's to start
quantity = "2"


##  Image ID to startup
##  CentOS7 
image_id = "fe8ab523-65b7-43c6-9fd8-31112f8570a5"

##  VM Flavor to startup: https://jetstream-cloud.org/tech-specs/cloud-services.php
##  Controls CPU / Memory footprint
vm_flavor = "m1.xlarge"

##  SSH Keypair control
keypair-name = "brockp-keypair"
keypair-path = "/home/brockp/.ssh/id_rsa.pub"


###############################################################################
##
#  Network options

secgroup = "brockp-secgroup"

internal-network = {
   network-name = "brockp-internal-network"
   subnet-name = "brockp-internal-subnet-1"
   subnet-cidr = "192.168.199.0/24"
   router-name = "brockp-router"
   external-gateway = "4367cd20-722f-4dc2-97e8-90d98c25f12e"
}
