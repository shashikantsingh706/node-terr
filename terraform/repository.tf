resource "aws_ecr_repository" "repo" {
  name                 = "app_repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

# Resource-based policy granting access to the IAM user
 policy = jsonencode({
  Version = "2008-10-17"
  Statement = [
      {
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam::891377310564:user/shashikant"
        },
        Action    = "ecr:InitiateLayerUpload",
        Resource  = aws_ecr_repository.repo.arn
      }
    ]
  })
}


