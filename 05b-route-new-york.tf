resource "aws_route_table" "new_york_pub_rtb" {
  provider = aws.nvirginia
  vpc_id   = aws_vpc.new_york_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new_york_igw.id
  }

  tags = {
    Name    = "new_york_pub_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table" "new_york_prv_rtb" {
  provider = aws.nvirginia
  vpc_id   = aws_vpc.new_york_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.new_york_ngw.id
  }
  tags = {
    Name    = "new_york_prv_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table_association" "new_york_pub_subnet_1a_rtetbl_assoc" {
  provider       = aws.nvirginia
  subnet_id      = aws_subnet.new_york_pub_subnet_1a.id
  route_table_id = aws_route_table.new_york_pub_rtb.id
}

resource "aws_route_table_association" "new_york_pub_subnet_1b_rtetbl_assoc" {
  provider       = aws.nvirginia
  subnet_id      = aws_subnet.new_york_pub_subnet_1b.id
  route_table_id = aws_route_table.new_york_pub_rtb.id
}

resource "aws_route_table_association" "new_york_prv_subnet_1a_rtetbl_assoc" {
  provider       = aws.nvirginia
  subnet_id      = aws_subnet.new_york_prv_subnet_1a.id
  route_table_id = aws_route_table.new_york_prv_rtb.id
}

resource "aws_route_table_association" "new_york_prv_subnet_1b_rtetbl_assoc" {
  provider       = aws.nvirginia
  subnet_id      = aws_subnet.new_york_prv_subnet_1b.id
  route_table_id = aws_route_table.new_york_prv_rtb.id
}
