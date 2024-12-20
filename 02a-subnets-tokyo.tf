resource "aws_subnet" "tokyo_pub_subnet_1a" {
  provider          = aws.tokyo
  vpc_id            = aws_vpc.tokyo_vpc.id
  cidr_block        = var.tokyo_pub_subnet_1a
  availability_zone = var.tokyo_availability_zone_1

  tags = {
    Name    = "tokyo_pub_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "tokyo_pub_subnet_1c" {
  provider          = aws.tokyo
  vpc_id            = aws_vpc.tokyo_vpc.id
  cidr_block        = var.tokyo_pub_subnet_1c
  availability_zone = var.tokyo_availability_zone_2

  tags = {
    Name    = "tokyo_pub_subnet_1c"
    Service = var.main_service
  }
}

resource "aws_subnet" "tokyo_prv_subnet_1a" {
  provider          = aws.tokyo
  vpc_id            = aws_vpc.tokyo_vpc.id
  cidr_block        = var.tokyo_prv_subnet_1a
  availability_zone = var.tokyo_availability_zone_1

  tags = {
    Name    = "tokyo_prv_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "tokyo_prv_subnet_1c" {
  provider          = aws.tokyo
  vpc_id            = aws_vpc.tokyo_vpc.id
  cidr_block        = var.tokyo_prv_subnet_1c
  availability_zone = var.tokyo_availability_zone_2

  tags = {
    Name    = "tokyo_prv_subnet_1c"
    Service = var.main_service
  }
}

resource "aws_subnet" "tokyo_prv_subnet_1d" {
  provider          = aws.tokyo
  vpc_id            = aws_vpc.tokyo_vpc.id
  cidr_block        = var.tokyo_prv_subnet_1d
  availability_zone = var.tokyo_availability_zone_3

  tags = {
    Name    = "tokyo_prv_subnet_1d"
    Service = var.main_service
  }
}

resource "aws_subnet" "tokyo_prv_subnet_1d_db" {
  provider          = aws.tokyo
  vpc_id            = aws_vpc.tokyo_vpc.id
  cidr_block        = var.tokyo_prv_subnet_1d_db
  availability_zone = var.tokyo_availability_zone_3

  tags = {
    Name    = "tokyo_prv_subnet_1d_db"
    Service = var.main_service
  }
}
