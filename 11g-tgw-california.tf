resource "aws_ec2_transit_gateway" "california_tgw" {
  provider    = aws.california
  description = "california_tgw"

  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]
  default_route_table_propagation = "disable"

  tags = {
    Name = "california_tgw"
  }
}

resource "aws_route" "california_prv_tgw_route" {
  provider               = aws.california
  route_table_id         = aws_route_table.california_prv_rtb.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.california_tgw.id
}



resource "aws_ec2_transit_gateway_vpc_attachment" "california_tgw_vpc_att" {
  provider           = aws.california
  subnet_ids         = [aws_subnet.california_prv_subnet_1a.id, aws_subnet.california_prv_subnet_1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.california_tgw.id
  vpc_id             = aws_vpc.california_vpc.id

  tags = {
    Name = "california_tgw_vpc_att"
  }
}

resource "aws_ec2_transit_gateway_route_table" "california_tgw_rtb" {
  provider           = aws.california
  transit_gateway_id = aws_ec2_transit_gateway.california_tgw.id
}



resource "aws_ec2_transit_gateway_route" "california_tgw_rte" {
  provider                       = aws.california
  destination_cidr_block         = aws_vpc.california_vpc.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.california_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.california_tgw_rtb.id
}

resource "aws_ec2_transit_gateway_route_table_association" "california_rtb_assoc" {
  provider                       = aws.california
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.california_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.california_tgw_rtb.id
}


