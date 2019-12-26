// tags
variable name {}
variable author {}
//VPC
variable region {}
variable cidr_block {}
variable assign_generated_ipv6  { default = false}
variable tenancy  { default = "default"} // default | dedicated

//subnets
variable cidr_subnets {} // list with only 4 subnets
variable region_az {} // list with only two AZ
variable enable_dns_support {default = false}
variable enable_dns_hostnames {default = false}
variable public_subnet_map_public_ip_on_launch {default = false} // Only for public subnets 
