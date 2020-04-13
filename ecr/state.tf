terraform {
  backend "s3" {
    bucket = "intive-terraform-state"
    key = "ecs/lab"
    region = "us-east-1"
  }
}
