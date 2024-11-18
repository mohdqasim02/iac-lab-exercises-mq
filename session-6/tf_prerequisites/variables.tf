variable "prefix" {
  type        = string
  description = "Prefix for resource names"
  default     = "mq-iac-lab"
}

variable "repo_name" {
  type        = string
  description = "repo name"
  default     = "mohdqasim02/iac-lab-exercises-mq"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "ap-south-1"
}