# General
name =  "eks"
region = "us-east-1"
//has_private_subnet = false
// has_egress_only_internet_gateway = true
// has_nat_instance = true
 has_nat_gateway = true

// VPC
cidr_block = "172.16.0.0/16"
assign_generated_ipv6= true

// Subnet
cidr_subnets  = ["172.16.0.0/18", "172.16.64.0/18", "172.16.128.0/18", "172.16.192.0/18"]
region_az = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d"]
public_subnet_map_public_ip_on_launch = true
