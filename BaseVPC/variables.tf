// configuration
variable has_private_subnet {default = true}
variable has_nat_gateway {default = false}
variable has_nat_instance {default = false}
variable has_egress-only-internet-gateway {default = false}

// tags
variable name {}
//VPC
variable region {}
variable cidr_block {}
variable assign_generated_ipv6  { default = false}
variable tenancy  { default = "default"} // default | dedicated
variable tags {
  default = {
    Created = "terraform"
  }
}

//subnets
variable cidr_subnets {} // list with only 4 subnets
variable region_az {} // list with only two AZ
variable enable_dns_support {default = false}
variable enable_dns_hostnames {default = false}
variable public_subnet_map_public_ip_on_launch {default = false} // Only for public subnets
