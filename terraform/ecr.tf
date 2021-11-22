# Production Repository

resource "aws_ecr_repository" "spring-petclinic" {
  name                 = "spring-petclinic"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "Elastic Container Registry to store Docker Artifacts"
  }
}

# Staging Repository

resource "aws_ecr_repository" "spring-petclinic-staging" {
  name                 = "spring-petclinic-staging"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "Elastic Container Registry to store Docker Artifacts"
  }
}

# Test Repository

resource "aws_ecr_repository" "spring-petclinic-test" {
  name                 = "spring-petclinic-test"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "Elastic Container Registry to store Docker Artifacts"
  }
}