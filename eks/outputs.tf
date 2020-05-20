output "name" {
  value       = var.name
  description = "cluster name"
}
output "private_subnet" {
  value       = var.private_subnet
  description = "private subnet"
}
output "public_subnet" {
  value       = var.public_subnet
  description = "public subnet"
}
output "vpc" {
  value       = var.vpc_id
  description = "vpc"
}
