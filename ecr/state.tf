terraform {
  backend "s3" {
    bucket = "intive-terraform-state"
    key = "ecr/lab"
    region = "us-east-1"
  }
}
