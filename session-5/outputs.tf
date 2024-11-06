output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "vpc_id for the plan"
}

output "ecr_url" {
  description = "The Elastic Container Registry (ECR) URL."
  value       = module.ecs.ecr_url
}

output "website_url" {
  description = "The website URL."
  value       = format("http://%s/users", aws_lb.lb.dns_name)
}