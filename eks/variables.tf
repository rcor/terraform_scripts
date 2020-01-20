// general
variable name {}
variable cluster_name {}
variable region {}

//
variable tags {
  default = {
    Created = "terraform"
  }
}
//vpc and subnet
variable vpc_id {}
variable private_subnet {}
