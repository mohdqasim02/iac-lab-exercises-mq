resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "${var.prefix}-tfstate"
  force_destroy = true

  versioning {
    enabled = true
  }
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  acl = "private"

  tags = {
    Name        = format("%s-s3-bucket", var.prefix)
  }
}