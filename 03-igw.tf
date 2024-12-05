resource "aws_internet_gateway" "tokyo_igw" {
  provider = aws.tokyo
  vpc_id   = aws_vpc.tokyo_vpc.id

  tags = {
    Name    = "tokyo_igw"
    Service = var.main_service
  }
}

resource "aws_internet_gateway" "new_york_igw" {
  provider = aws.nvirginia
  vpc_id   = aws_vpc.new_york_vpc.id

  tags = {
    Name    = "new_york_igw"
    Service = var.main_service
  }
}

resource "aws_internet_gateway" "london_igw" {
  provider = aws.london
  vpc_id   = aws_vpc.london_vpc.id

  tags = {
    Name    = "london_igw"
    Service = var.main_service
  }
}

resource "aws_internet_gateway" "saopaulo_igw" {
  provider = aws.saopaulo
  vpc_id   = aws_vpc.saopaulo_vpc.id

  tags = {
    Name    = "saopaulo_igw"
    Service = var.main_service
  }
}

resource "aws_internet_gateway" "australia_igw" {
  provider = aws.australia
  vpc_id   = aws_vpc.australia_vpc.id

  tags = {
    Name    = "australia_igw"
    Service = var.main_service
  }
}

resource "aws_internet_gateway" "hongkong_igw" {
  provider = aws.hongkong
  vpc_id   = aws_vpc.hongkong_vpc.id

  tags = {
    Name    = "hongkong_igw"
    Service = var.main_service
  }
}

resource "aws_internet_gateway" "california_igw" {
  provider = aws.california
  vpc_id   = aws_vpc.california_vpc.id

  tags = {
    Name    = "california_igw"
    Service = var.main_service
  }
}