resource "aws_vpc" "tokyo_vpc" {
  provider   = aws.tokyo
  cidr_block = var.tokyo_vpc_cidr

  instance_tenancy = "default"
  tags = {
    Name    = "tokyo_vpc"
    Service = var.main_service
  }

  enable_dns_hostnames = true
}

resource "aws_vpc" "new_york_vpc" {
  provider   = aws.nvirginia
  cidr_block = var.new_york_vpc_cidr

  instance_tenancy = "default"
  tags = {
    Name    = "new_york_vpc"
    Service = var.main_service
  }

  enable_dns_hostnames = true
}

output "name" {
  value = var.main_service
}