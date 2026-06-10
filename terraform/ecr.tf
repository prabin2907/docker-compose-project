variable "repositories" {
  default = {
    frontend = "wpoms-frontend"
    backend  = "wpoms-backend"
  }
}

resource "aws_ecr_repository" "repos" {
  for_each = var.repositories
  name     = each.value
}

output "repo_urls" {
  value = {
    for key, repo in aws_ecr_repository.repos : key => repo.repository_url
  }
}