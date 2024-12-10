resource "aws_ec2_transit_gateway" "australia_tgw" {
  provider    = aws.australia
  description = "australia_tgw"

  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]
  default_route_table_propagation = "disable"

  tags = {
    Name = "australia_tgw"
  }
}

resource "aws_route" "australia_prv_tgw_route" {
  provider               = aws.australia
  route_table_id         = aws_route_table.australia_prv_rtb.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.australia_tgw.id
}



resource "aws_ec2_transit_gateway_vpc_attachment" "australia_tgw_vpc_att" {
  provider           = aws.australia
  subnet_ids         = [aws_subnet.australia_prv_subnet_1a.id, aws_subnet.australia_prv_subnet_1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.australia_tgw.id
  vpc_id             = aws_vpc.australia_vpc.id

  tags = {
    Name = "australia_tgw_vpc_att"
  }
}

resource "aws_ec2_transit_gateway_route_table" "australia_tgw_rtb" {
  provider           = aws.australia
  transit_gateway_id = aws_ec2_transit_gateway.australia_tgw.id
}



resource "aws_ec2_transit_gateway_route" "australia_tgw_rte" {
  provider                       = aws.australia
  destination_cidr_block         = aws_vpc.australia_vpc.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.australia_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.australia_tgw_rtb.id
}

resource "aws_ec2_transit_gateway_route_table_association" "australia_rtb_assoc" {
  provider                       = aws.australia
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.australia_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.australia_tgw_rtb.id
}


