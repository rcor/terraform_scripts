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


variable "oidc_thumbprint_list" {
  type    = list
  default = []
}

variable node_group{
   type = list(object({
      node_group_name = string
      instance_types = list(string)
      tags = map(any)
      labels = map(any)
      disk_size = number
      scaling_config = object({
      	desired_size = number
      	max_size = number
      	min_size = number
      })
  }))
   description = " Node groups for EKS"
   default=[{
       node_group_name = "group_name",
       instance_types = ["t2.medium"],
       tags = {},
       labels = {},
       disk_size = 20,
       scaling_config = {
         desired_size=1,
         max_size=1,
         min_size=1,
       }
     }]
}
