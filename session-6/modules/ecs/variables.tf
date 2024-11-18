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

variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "private subnet ids"
}

variable "alb_target_group_arn" {
  type        = string
  description = "alb target group arn"
}

variable "alb_security_group_id" {
  type        = string
  description = "alb security group id"
}

variable "db_address" {
  type        = string
  description = "db address"
}

variable "db_name" {
  type        = string
  description = "db name"
}

variable "db_username" {
  type        = string
  description = "db username"
}

variable "db_secret_arn" {
  type        = string
  description = "db secret"
}

variable "db_secret_key_id" {
  type        = string
  description = "db secret key id"
}