variable "repositories" {
  default = {
    frontend = "wpoms-frontend-p"
    backend  = "wpoms-backend-p"
  }
}

resource "aws_ecr_repository" "repos" {
  for_each = var.repositories
  name     = each.value
  force_delete = true
}

output "repo_urls" {
  value = {
    for key, repo in aws_ecr_repository.repos : key => repo.repository_url
  }
}