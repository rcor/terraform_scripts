
output "url" {
  value       =  ["${aws_ecr_repository.repositories[*].repository_url}"]
  description = "Repository URL"
}

output "registry_id" {
  value       = ["${aws_ecr_repository.repositories[*].registry_id}"]
  description = "Repository URL"
}
