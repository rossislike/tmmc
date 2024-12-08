resource "aws_route_table" "california_pub_rtb" {
  provider = aws.california
  vpc_id   = aws_vpc.california_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.california_igw.id
  }

  tags = {
    Name    = "california_pub_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table" "california_prv_rtb" {
  provider = aws.california
  vpc_id   = aws_vpc.california_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.california_ngw.id
  }
  tags = {
    Name    = "california_prv_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table_association" "california_pub_subnet_1a_rtb_assoc" {
  provider       = aws.california
  subnet_id      = aws_subnet.california_pub_subnet_1a.id
  route_table_id = aws_route_table.california_pub_rtb.id
}

resource "aws_route_table_association" "california_pub_subnet_1b_rtb_assoc" {
  provider       = aws.california
  subnet_id      = aws_subnet.california_pub_subnet_1b.id
  route_table_id = aws_route_table.california_pub_rtb.id
}

resource "aws_route_table_association" "california_prv_subnet_1a_rtb_assoc" {
  provider       = aws.california
  subnet_id      = aws_subnet.california_prv_subnet_1a.id
  route_table_id = aws_route_table.california_prv_rtb.id
}

resource "aws_route_table_association" "california_prv_subnet_1b_rtb_assoc" {
  provider       = aws.california
  subnet_id      = aws_subnet.california_prv_subnet_1b.id
  route_table_id = aws_route_table.california_prv_rtb.id
}
