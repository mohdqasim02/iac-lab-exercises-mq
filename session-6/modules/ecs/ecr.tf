resource "aws_ecr_repository" "api" {
  name                 = "${var.prefix}-crud-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = format("%s-ecr-rep", var.prefix)
  }
}