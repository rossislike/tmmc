resource "aws_route_table" "saopaulo_pub_rtb" {
  provider = aws.saopaulo
  vpc_id   = aws_vpc.saopaulo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.saopaulo_igw.id
  }

  tags = {
    Name    = "saopaulo_pub_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table" "saopaulo_prv_rtb" {
  provider = aws.saopaulo
  vpc_id   = aws_vpc.saopaulo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.saopaulo_ngw.id
  }
  tags = {
    Name    = "saopaulo_prv_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table_association" "saopaulo_pub_subnet_1a_rtb_assoc" {
  provider       = aws.saopaulo
  subnet_id      = aws_subnet.saopaulo_pub_subnet_1a.id
  route_table_id = aws_route_table.saopaulo_pub_rtb.id
}

resource "aws_route_table_association" "saopaulo_pub_subnet_1b_rtb_assoc" {
  provider       = aws.saopaulo
  subnet_id      = aws_subnet.saopaulo_pub_subnet_1b.id
  route_table_id = aws_route_table.saopaulo_pub_rtb.id
}

resource "aws_route_table_association" "saopaulo_prv_subnet_1a_rtb_assoc" {
  provider       = aws.saopaulo
  subnet_id      = aws_subnet.saopaulo_prv_subnet_1a.id
  route_table_id = aws_route_table.saopaulo_prv_rtb.id
}

resource "aws_route_table_association" "saopaulo_prv_subnet_1b_rtb_assoc" {
  provider       = aws.saopaulo
  subnet_id      = aws_subnet.saopaulo_prv_subnet_1b.id
  route_table_id = aws_route_table.saopaulo_prv_rtb.id
}
