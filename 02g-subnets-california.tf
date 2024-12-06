resource "aws_subnet" "california_pub_subnet_1a" {
  provider          = aws.california
  vpc_id            = aws_vpc.california_vpc.id
  cidr_block        = var.california_pub_subnet_1a
  availability_zone = var.california_availability_zone_1

  tags = {
    Name    = "california_pub_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "california_pub_subnet_1b" {
  provider          = aws.california
  vpc_id            = aws_vpc.california_vpc.id
  cidr_block        = var.california_pub_subnet_1b
  availability_zone = var.california_availability_zone_2

  tags = {
    Name    = "california_pub_subnet_1b"
    Service = var.main_service
  }
}

resource "aws_subnet" "california_prv_subnet_1a" {
  provider          = aws.california
  vpc_id            = aws_vpc.california_vpc.id
  cidr_block        = var.california_prv_subnet_1a
  availability_zone = var.california_availability_zone_1

  tags = {
    Name    = "california_prv_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "california_prv_subnet_1b" {
  provider          = aws.california
  vpc_id            = aws_vpc.california_vpc.id
  cidr_block        = var.california_prv_subnet_1b
  availability_zone = var.california_availability_zone_2

  tags = {
    Name    = "california_prv_subnet_1b"
    Service = var.main_service
  }
}