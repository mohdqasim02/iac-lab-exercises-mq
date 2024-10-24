terraform {
  backend "s3" {
    bucket = "mq-iac-lab-tfstate"
    key    = "path/to/my_key"
    region = "ap-south-1"

    dynamodb_table = "mq-iac-lab-tfstate-locks"
    encrypt        = true
  }
}