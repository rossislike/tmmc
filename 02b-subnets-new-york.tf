resource "aws_subnet" "new_york_pub_subnet_1a" {
  provider          = aws.nvirginia
  vpc_id            = aws_vpc.new_york_vpc.id
  cidr_block        = var.new_york_pub_subnet_1a
  availability_zone = var.new_york_availability_zone_1

  tags = {
    Name = "new_york_pub_subnet_1a"
    Service = var.main_service
  }
}

resource "aws_subnet" "new_york_pub_subnet_1b" {
  provider          = aws.nvirginia
  vpc_id            = aws_vpc.new_york_vpc.id
  cidr_block        = var.new_york_pub_subnet_1b
  availability_zone = var.new_york_availability_zone_2

  tags = {
    Name = "new_york_pub_subnet_1b"
    Service = var.main_service
  }
}

resource "aws_subnet" "new_york_prv_subnet_1a" {
  provider          = aws.nvirginia
  vpc_id            = aws_vpc.new_york_vpc.id
  cidr_block        = var.new_york_prv_subnet_1a
  availability_zone = var.new_york_availability_zone_1

  tags = {
    Name = "new_york_prv_subnet_1a"
    Service = var.main_service
  }
}
resource "aws_subnet" "new_york_prv_subnet_1b" {
  provider          = aws.nvirginia
  vpc_id            = aws_vpc.new_york_vpc.id
  cidr_block        = var.new_york_prv_subnet_1b
  availability_zone = var.new_york_availability_zone_2

  tags = {
    Name = "new_york_prv_subnet_1b"
    Service = var.main_service
  }
}
