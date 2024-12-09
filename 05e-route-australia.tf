resource "aws_route_table" "australia_pub_rtb" {
  provider = aws.australia
  vpc_id   = aws_vpc.australia_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.australia_igw.id
  }

  tags = {
    Name    = "australia_pub_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table" "australia_prv_rtb" {
  provider = aws.australia
  vpc_id   = aws_vpc.australia_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.australia_ngw.id
  }
  tags = {
    Name    = "australia_prv_rtb"
    Service = var.main_service
  }
}

resource "aws_route_table_association" "australia_pub_subnet_1a_rtb_assoc" {
  provider       = aws.australia
  subnet_id      = aws_subnet.australia_pub_subnet_1a.id
  route_table_id = aws_route_table.australia_pub_rtb.id
}

resource "aws_route_table_association" "australia_pub_subnet_1b_rtb_assoc" {
  provider       = aws.australia
  subnet_id      = aws_subnet.australia_pub_subnet_1b.id
  route_table_id = aws_route_table.australia_pub_rtb.id
}

resource "aws_route_table_association" "australia_prv_subnet_1a_rtb_assoc" {
  provider       = aws.australia
  subnet_id      = aws_subnet.australia_prv_subnet_1a.id
  route_table_id = aws_route_table.australia_prv_rtb.id
}

resource "aws_route_table_association" "australia_prv_subnet_1b_rtb_assoc" {
  provider       = aws.australia
  subnet_id      = aws_subnet.australia_prv_subnet_1b.id
  route_table_id = aws_route_table.australia_prv_rtb.id
}
