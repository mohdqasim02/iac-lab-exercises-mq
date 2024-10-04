terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  region = var.region
}

variable "region" {
  type        = string
  description = "Region to deploy the solution"
  default     = "ap-south-1"
}

resource "aws_vpc" "vpc" {
  cidr_block           = "192.168.1.0/25"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    Name = "iac-lab-mq"
  }
}