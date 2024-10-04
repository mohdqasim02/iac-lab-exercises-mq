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

variable "subnet1_cidr" {
  type        = string
  description = "subnet1 CIDR block"
}

variable "subnet2_cidr" {
  type        = string
  description = "subnet2 CIDR block"
}

variable "subnet3_cidr" {
  type        = string
  description = "subnet3 CIDR block"
}

variable "subnet4_cidr" {
  type        = string
  description = "subnet4 CIDR block"
}

variable "subnet5_cidr" {
  type        = string
  description = "subnet5 CIDR block"
}

variable "subnet6_cidr" {
  type        = string
  description = "subnet6 CIDR block"
}