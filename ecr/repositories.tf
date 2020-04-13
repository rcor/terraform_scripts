resource "aws_ecr_repository" "repositories" {
  count = length(var.repositories)
  name = var.repositories[count.index]["name"]
  image_tag_mutability = var.repositories[count.index]["image_tag_mutability"]
  image_scanning_configuration {
    scan_on_push = var.repositories[count.index]["scan_on_push"]
  }
  tags = merge(
    {
      "CreatedBy" = "terraform", "Project"= var.name
    },
    var.repositories[count.index]["tags"]
  )
}
