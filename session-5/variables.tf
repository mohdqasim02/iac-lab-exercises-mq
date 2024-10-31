variable "prefix" {
  type        = string
  description = "Prefix for resource names"
  default     = "mq-iac-lab"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "ap-south-1"
}

variable "az-1" {
  type        = string
  description = "Availability zone"
  default     = "ap-south-1a"
}

variable "az-2" {
  type        = string
  description = "Availability zone"
  default     = "ap-south-1b"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}