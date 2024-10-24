resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

locals {
  subnets = tolist([
    "public_subnet_1",
    "private_subnet_1",
    "secure_subnet_1",
    "public_subnet_2",
    "private_subnet_2",
    "secure_subnet_2",
  ])

  azs = tolist([
    var.az-1,
    var.az-2,
  ])
}

resource "aws_subnet" "subnets" {
  count             = 6
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 3, count.index)
  availability_zone = element(local.azs, count.index % 2)

  tags = {
    Group = format("%s-subnet", var.prefix)
    Name  = format("%s-%s", var.prefix, element(local.subnets, count.index))
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = format("%s-gw", var.prefix)
  }
}

resource "aws_eip" "eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.subnets[0].id

  tags = {
    Name = format("%s-nat-gw", var.prefix)
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = format("%s-public-route-table", var.prefix)
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = format("%s-private-route-table", var.prefix)
  }
}

resource "aws_route_table_association" "public-routes" {
  count          = 2
  subnet_id      = aws_subnet.subnets[count.index * 3].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private-routes" {
  count          = 2
  subnet_id      = aws_subnet.subnets[(count.index * 3) + 1].id
  route_table_id = aws_route_table.private_route_table.id
}