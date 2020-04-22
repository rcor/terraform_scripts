name = "lab"
region = "us-east-1"
vpc_id = "vpc-0ce08af34509c5ada"
cluster_name = "lab"
profile = "default"

private_subnet = ["subnet-09ab22472d20d9e21","subnet-0d62baf95c9e42f0b"]
public_subnet = ["subnet-008650b96ff91f6da","subnet-0cc734d94a83689d9"]
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
