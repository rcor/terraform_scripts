name = "lab"
region = "us-east-1"
vpc_id = "vpc-0ce08af34509c5ada"
cluster_name = "lab"
profile = "default"

private_subnet = ["subnet-0b4a0542b18376aa1","subnet-07ddaf1fb7a5d1b77"]
public_subnet = ["subnet-0931cfe96bfc01b74","subnet-038494d82f7cb7703"]
has_endpoint_private_access=true

node_group = [
  {
    node_group_name = "node_group01",
    instance_types = ["t2.medium"],
    tags = {
      "Created" = "terraform",
      "Name" = "node_group01",
      "env" = "prod"
    },
    labels = {
      "app" = "app01",
      "env" = "prod",
    },
    disk_size = 30,
    scaling_config = {
      desired_size = 1,
      max_size = 2,
      min_size = 1,
    }
  }

]
