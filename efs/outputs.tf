output "efs_arn" {
  value       = aws_efs_file_system.file_system.arn
  description = "EFS arn"
}

output "efs_id" {
  value       = aws_efs_file_system.file_system.id
  description = "EFS arn"
}

output "efs_dns_name" {
  value       = aws_efs_file_system.file_system.dns_name
  description = "EFS dns_name"
}
