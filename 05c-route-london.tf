resource "aws_route_table" "london_pub_rtb" {
  provider = aws.london
  vpc_id   = aws_vpc.london_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.london_igw.id
  }

  tags = {
    Name    = "london_pub_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table" "london_prv_rtb" {
  provider = aws.london
  vpc_id   = aws_vpc.london_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.london_ngw.id
  }
  tags = {
    Name    = "london_prv_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table_association" "london_pub_subnet_1a_rtb_assoc" {
  provider       = aws.london
  subnet_id      = aws_subnet.london_pub_subnet_1a.id
  route_table_id = aws_route_table.london_pub_rtb.id
}

resource "aws_route_table_association" "london_pub_subnet_1b_rtb_assoc" {
  provider       = aws.london
  subnet_id      = aws_subnet.london_pub_subnet_1b.id
  route_table_id = aws_route_table.london_pub_rtb.id
}

resource "aws_route_table_association" "london_prv_subnet_1a_rtb_assoc" {
  provider       = aws.london
  subnet_id      = aws_subnet.london_prv_subnet_1a.id
  route_table_id = aws_route_table.london_prv_rtb.id
}

resource "aws_route_table_association" "london_prv_subnet_1b_rtb_assoc" {
  provider       = aws.london
  subnet_id      = aws_subnet.london_prv_subnet_1b.id
  route_table_id = aws_route_table.london_prv_rtb.id
}
