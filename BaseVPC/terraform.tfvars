# General
name =  "terraform"
region = "us-east-1"
author = "rodolfo"

// VPC
cidr_block = "172.16.0.0/16"

// Subnet
cidr_subnets  = ["172.16.0.0/18", "172.16.64.0/18", "172.16.128.0/18", "172.16.192.0/18"]
region_az = ["us-east-1a","us-east-1b"]
public_subnet_map_public_ip_on_launch = true
