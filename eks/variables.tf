// general
variable name {}
variable cluster_name {}
variable region {}

//eks

variable has_endpoint_public_access {
  default=true
}
variable has_endpoint_private_access {
   default = false
}

//
variable tags {
  default = {
    Created = "terraform"
  }
}
//vpc and subnet
variable vpc_id {}
variable private_subnet {}
variable instance_type {
  default = "t2.medium"
}

variable scaling_config {
  default = {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
}
variable node_group_name {}
