resource "aws_subnet" "hongkong_pub_subnet_1a" {
  provider          = aws.hongkong
  vpc_id            = aws_vpc.hongkong_vpc.id
  cidr_block        = var.hongkong_pub_subnet_1a
  availability_zone = var.hongkong_availability_zone_1

  tags = {
    Name    = "hongkong_pub_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "hongkong_pub_subnet_1b" {
  provider          = aws.hongkong
  vpc_id            = aws_vpc.hongkong_vpc.id
  cidr_block        = var.hongkong_pub_subnet_1b
  availability_zone = var.hongkong_availability_zone_2

  tags = {
    Name    = "hongkong_pub_subnet_1b"
    Service = var.main_service
  }
}

resource "aws_subnet" "hongkong_prv_subnet_1a" {
  provider          = aws.hongkong
  vpc_id            = aws_vpc.hongkong_vpc.id
  cidr_block        = var.hongkong_prv_subnet_1a
  availability_zone = var.hongkong_availability_zone_1

  tags = {
    Name    = "hongkong_prv_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "hongkong_prv_subnet_1b" {
  provider          = aws.hongkong
  vpc_id            = aws_vpc.hongkong_vpc.id
  cidr_block        = var.hongkong_prv_subnet_1b
  availability_zone = var.hongkong_availability_zone_2

  tags = {
    Name    = "hongkong_prv_subnet_1b"
    Service = var.main_service
  }
}