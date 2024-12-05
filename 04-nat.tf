resource "aws_eip" "tokyo_eip" {
  provider = aws.tokyo
  tags = {
    Name    = "tokyo_eip"
    Service = var.main_service
  }
}

resource "aws_nat_gateway" "tokyo_ngw" {
  provider      = aws.tokyo
  allocation_id = aws_eip.tokyo_eip.id
  subnet_id     = aws_subnet.tokyo_pub_subnet_1a.id

  tags = {
    Name    = "tokyo_ngw"
    Service = var.main_service
  }

  depends_on = [aws_internet_gateway.tokyo_igw]
}

resource "aws_eip" "new_york_eip" {
  provider = aws.nvirginia
  tags = {
    Name    = "new_york_eip"
    Service = var.main_service
  }
}

resource "aws_nat_gateway" "new_york_ngw" {
  provider      = aws.nvirginia
  allocation_id = aws_eip.new_york_eip.id
  subnet_id     = aws_subnet.new_york_pub_subnet_1a.id

  tags = {
    Name    = "new_york_ngw"
    Service = var.main_service
  }

  depends_on = [aws_internet_gateway.new_york_igw]
}

