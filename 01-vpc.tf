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

resource "aws_vpc" "london_vpc" {
  provider   = aws.london
  cidr_block = var.london_vpc_cidr

  instance_tenancy = "default"
  tags = {
    Name    = "london_vpc"
    Service = var.main_service
  }

  enable_dns_hostnames = true
}

resource "aws_vpc" "saopaulo_vpc" {
  provider   = aws.saopaulo
  cidr_block = var.saopaulo_vpc_cidr

  instance_tenancy = "default"
  tags = {
    Name    = "saopaulo_vpc"
    Service = var.main_service
  }

  enable_dns_hostnames = true
}

resource "aws_vpc" "australia_vpc" {
  provider   = aws.australia
  cidr_block = var.australia_vpc_cidr

  instance_tenancy = "default"
  tags = {
    Name    = "australia_vpc"
    Service = var.main_service
  }

  enable_dns_hostnames = true
}

resource "aws_vpc" "hongkong_vpc" {
  provider   = aws.hongkong
  cidr_block = var.hongkong_vpc_cidr

  instance_tenancy = "default"
  tags = {
    Name    = "hongkong_vpc"
    Service = var.main_service
  }

  enable_dns_hostnames = true
}

resource "aws_vpc" "california_vpc" {
  provider   = aws.california
  cidr_block = var.california_vpc_cidr

  instance_tenancy = "default"
  tags = {
    Name    = "california_vpc"
    Service = var.main_service
  }

  enable_dns_hostnames = true
}


output "name" {
  value = var.main_service
}