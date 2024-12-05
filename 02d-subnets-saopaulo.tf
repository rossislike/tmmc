resource "aws_subnet" "saopaulo_pub_subnet_1a" {
  provider          = aws.saopaulo
  vpc_id            = aws_vpc.saopaulo_vpc.id
  cidr_block        = var.saopaulo_pub_subnet_1a
  availability_zone = var.saopaulo_availability_zone_1

  tags = {
    Name    = "saopaulo_pub_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "saopaulo_pub_subnet_1b" {
  provider          = aws.saopaulo
  vpc_id            = aws_vpc.saopaulo_vpc.id
  cidr_block        = var.saopaulo_pub_subnet_1b
  availability_zone = var.saopaulo_availability_zone_2

  tags = {
    Name    = "saopaulo_pub_subnet_1b"
    Service = var.main_service
  }
}

resource "aws_subnet" "saopaulo_prv_subnet_1a" {
  provider          = aws.saopaulo
  vpc_id            = aws_vpc.saopaulo_vpc.id
  cidr_block        = var.saopaulo_prv_subnet_1a
  availability_zone = var.saopaulo_availability_zone_1

  tags = {
    Name    = "saopaulo_prv_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "saopaulo_prv_subnet_1b" {
  provider          = aws.saopaulo
  vpc_id            = aws_vpc.saopaulo_vpc.id
  cidr_block        = var.saopaulo_prv_subnet_1b
  availability_zone = var.saopaulo_availability_zone_2

  tags = {
    Name    = "saopaulo_prv_subnet_1b"
    Service = var.main_service
  }
}