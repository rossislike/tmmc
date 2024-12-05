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