resource "aws_ec2_transit_gateway" "london_tgw" {
  provider    = aws.london
  description = "london_tgw"

  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]
  default_route_table_propagation = "disable"

  tags = {
    Name = "london_tgw"
  }
}

resource "aws_route" "london_prv_tgw_route" {
  provider               = aws.london
  route_table_id         = aws_route_table.london_prv_rtb.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.london_tgw.id
}



resource "aws_ec2_transit_gateway_vpc_attachment" "london_tgw_vpc_att" {
  provider           = aws.london
  subnet_ids         = [aws_subnet.london_prv_subnet_1a.id, aws_subnet.london_prv_subnet_1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.london_tgw.id
  vpc_id             = aws_vpc.london_vpc.id

  tags = {
    Name = "london_tgw_vpc_att"
  }
}

resource "aws_ec2_transit_gateway_route_table" "london_tgw_rtb" {
  provider           = aws.london
  transit_gateway_id = aws_ec2_transit_gateway.london_tgw.id
}



resource "aws_ec2_transit_gateway_route" "london_tgw_rte" {
  provider                       = aws.london
  destination_cidr_block         = aws_vpc.london_vpc.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.london_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.london_tgw_rtb.id
}

resource "aws_ec2_transit_gateway_route_table_association" "london_rtb_assoc" {
  provider                       = aws.london
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.london_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.london_tgw_rtb.id
}


