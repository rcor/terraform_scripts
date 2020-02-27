name =  "lab"
region = "us-east-1"
vpc_id = "vpc-0f1befcc07843be83"
cluster_name = "lab"

private_subnet = ["subnet-0ef29bb983a951c33","subnet-0cfd829f3057cf722"]
has_endpoint_private_access=true

node_group = [
  {
    node_group_name = "node_group01",
    instance_types = ["t2.medium"],
    tags = {
      "Created" = "terraform"
      "Name" = "node_group01"
      "env" = "prod"
    },
    labels = {
      "app" = "app01"
      "env" = "prod"
    },
    disk_size = 30,
    scaling_config = {
      desired_size = 1,
      max_size = 2,
      min_size = 1,
    }
  }
]
