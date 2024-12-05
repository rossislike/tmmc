resource "aws_route_table" "tokyo_pub_rtb" {
  provider = aws.tokyo
  vpc_id   = aws_vpc.tokyo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tokyo_igw.id
  }

  tags = {
    Name    = "tokyo_pub_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table" "tokyo_prv_rtb" {
  provider = aws.tokyo
  vpc_id   = aws_vpc.tokyo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tokyo_ngw.id
  }
  tags = {
    Name    = "tokyo_prv_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table_association" "tokyo_pub_subnet_1a_rtetbl_assoc" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.tokyo_pub_subnet_1a.id
  route_table_id = aws_route_table.tokyo_pub_rtb.id
}

resource "aws_route_table_association" "tokyo_pub_subnet_1c_rtetbl_assoc" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.tokyo_pub_subnet_1c.id
  route_table_id = aws_route_table.tokyo_pub_rtb.id
}

resource "aws_route_table_association" "tokyo_prv_subnet_1a_rtetbl_assoc" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.tokyo_prv_subnet_1a.id
  route_table_id = aws_route_table.tokyo_prv_rtb.id
}

resource "aws_route_table_association" "tokyo_prv_subnet_1c_rtetbl_assoc" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.tokyo_prv_subnet_1c.id
  route_table_id = aws_route_table.tokyo_prv_rtb.id
}
