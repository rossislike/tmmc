resource "aws_subnet" "london_pub_subnet_1a" {
  provider          = aws.london
  vpc_id            = aws_vpc.london_vpc.id
  cidr_block        = var.london_pub_subnet_1a
  availability_zone = var.london_availability_zone_1

  tags = {
    Name    = "london_pub_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "london_pub_subnet_1b" {
  provider          = aws.london
  vpc_id            = aws_vpc.london_vpc.id
  cidr_block        = var.london_pub_subnet_1b
  availability_zone = var.london_availability_zone_2

  tags = {
    Name    = "london_pub_subnet_1b"
    Service = var.main_service
  }
}

resource "aws_subnet" "london_prv_subnet_1a" {
  provider          = aws.london
  vpc_id            = aws_vpc.london_vpc.id
  cidr_block        = var.london_prv_subnet_1a
  availability_zone = var.london_availability_zone_1

  tags = {
    Name    = "london_prv_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "london_prv_subnet_1b" {
  provider          = aws.london
  vpc_id            = aws_vpc.london_vpc.id
  cidr_block        = var.london_prv_subnet_1b
  availability_zone = var.london_availability_zone_2

  tags = {
    Name    = "london_prv_subnet_1b"
    Service = var.main_service
  }
}