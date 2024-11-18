module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = format("%s-vpc", var.prefix)
  cidr = var.vpc_cidr

  azs             = [var.az-1, var.az-2]
  private_subnets = [cidrsubnet(var.vpc_cidr, 3, 0), cidrsubnet(var.vpc_cidr, 3, 1)]
  public_subnets  = [cidrsubnet(var.vpc_cidr, 3, 2), cidrsubnet(var.vpc_cidr, 3, 3)]
  intra_subnets   = [cidrsubnet(var.vpc_cidr, 3, 4), cidrsubnet(var.vpc_cidr, 3, 5)]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
}