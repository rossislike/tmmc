resource "aws_vpc" "tokyo_vpc" {
  cidr_block       = "10.9.0.0/16"
  provider = aws.tokyo

  instance_tenancy = "default"
  tags = {
    Name    = "tokyo_vpc"
    Service = "J-Tele-Doctor"
  }

  enable_dns_hostnames = true
}

resource "aws_vpc" "new_york_vpc" {
  cidr_block       = "10.8.0.0/16"
  provider = aws.nvirginia

  instance_tenancy = "default"
  tags = {
    Name    = "new_york_vpc"
    Service = "J-Tele-Doctor"
  }

  enable_dns_hostnames = true
}

