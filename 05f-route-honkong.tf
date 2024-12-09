resource "aws_route_table" "hongkong_pub_rtb" {
  provider = aws.hongkong
  vpc_id   = aws_vpc.hongkong_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hongkong_igw.id
  }

  tags = {
    Name    = "hongkong_pub_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table" "hongkong_prv_rtb" {
  provider = aws.hongkong
  vpc_id   = aws_vpc.hongkong_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.hongkong_ngw.id
  }
  tags = {
    Name    = "hongkong_prv_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table_association" "hongkong_pub_subnet_1a_rtb_assoc" {
  provider       = aws.hongkong
  subnet_id      = aws_subnet.hongkong_pub_subnet_1a.id
  route_table_id = aws_route_table.hongkong_pub_rtb.id
}

resource "aws_route_table_association" "hongkong_pub_subnet_1b_rtb_assoc" {
  provider       = aws.hongkong
  subnet_id      = aws_subnet.hongkong_pub_subnet_1b.id
  route_table_id = aws_route_table.hongkong_pub_rtb.id
}

resource "aws_route_table_association" "hongkong_prv_subnet_1a_rtb_assoc" {
  provider       = aws.hongkong
  subnet_id      = aws_subnet.hongkong_prv_subnet_1a.id
  route_table_id = aws_route_table.hongkong_prv_rtb.id
}

resource "aws_route_table_association" "hongkong_prv_subnet_1b_rtb_assoc" {
  provider       = aws.hongkong
  subnet_id      = aws_subnet.hongkong_prv_subnet_1b.id
  route_table_id = aws_route_table.hongkong_prv_rtb.id
}
