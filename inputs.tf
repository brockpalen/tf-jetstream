###########################################
# Brock Palen
# brockp@umich.edu
# http://arc-ts.umich.edu/

# Check: https://www.terraform.io/docs/configuration/interpolation.html

variable "quantity" {
  default     = 1
  description = "Number of basic machines to start"
}

variable "image_id" {
  default     = "fe8ab523-65b7-43c6-9fd8-31112f8570a5"
  description = "Image ID of VM to start on Jetstream, look ato the API images in Horizon"
}

variable "vm_flavor" {
  default     = "m1.tiny"
  description = "VM flavor to to start https://jetstream-cloud.org/tech-specs/cloud-services.php"
}

variable "keypair-name" {
  description = "SSH Keypair name. This is the name it will be in OpenStack"
  default     = "brockp-keypair"
}

variable "keypair-path" {
  default     = "/home/brockp/.ssh/id_rsa.pub"
  description = "SSH Keypair PUBLIC key location  You can generate ssh-keygen -t rsa -f outputname"
}

#############################################
#  Network Options

variable "secgroup" {
  default     = "brockp-secgroup"
  description = "Name of Security Group created and applied to the VMs"
}

variable "internal-network" {
  type = "map"

  description = "all the network naming and options"

  default = {
    network-name     = "brockp-internal-network"
    subnet-name      = "brockp-internal-subnet-1"
    subnet-cidr      = "192.168.199.0/24"
    router-name      = "brockp-router"
    external-gateway = "4367cd20-722f-4dc2-97e8-90d98c25f12e"
  }
}
