resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet1_cidr
  availability_zone = var.az-1

  tags = {
    Group = format("%s-subnet", var.prefix)
    Name  = format("%s-public-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet2_cidr
  availability_zone = var.az-1

  tags = {
    Group = format("%s-subnet", var.prefix)
    Name  = format("%s-private-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet3_cidr
  availability_zone = var.az-1

  tags = {
    Group = format("%s-subnet", var.prefix)
    Name  = format("%s-secure-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "subnet4" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet4_cidr
  availability_zone = var.az-2

  tags = {
    Group = format("%s-subnet", var.prefix)
    Name  = format("%s-public-subnet-2", var.prefix)
  }
}

resource "aws_subnet" "subnet5" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet5_cidr
  availability_zone = var.az-2

  tags = {
    Group = format("%s-subnet", var.prefix)
    Name  = format("%s-private-subnet-2", var.prefix)
  }
}

resource "aws_subnet" "subnet6" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet6_cidr
  availability_zone = var.az-2

  tags = {
    Group = format("%s-subnet", var.prefix)
    Name  = format("%s-secure-subnet-2", var.prefix)
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
  subnet_id     = aws_subnet.subnet2.id

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

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet4.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.subnet5.id
  route_table_id = aws_route_table.private_route_table.id
}