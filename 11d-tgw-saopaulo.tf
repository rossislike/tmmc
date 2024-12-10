resource "aws_ec2_transit_gateway" "saopaulo_tgw" {
  provider    = aws.saopaulo
  description = "saopaulo_tgw"

  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]
  default_route_table_propagation = "disable"

  tags = {
    Name = "saopaulo_tgw"
  }
}

resource "aws_route" "saopaulo_prv_tgw_route" {
  provider               = aws.saopaulo
  route_table_id         = aws_route_table.saopaulo_prv_rtb.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.saopaulo_tgw.id
}



resource "aws_ec2_transit_gateway_vpc_attachment" "saopaulo_tgw_vpc_att" {
  provider           = aws.saopaulo
  subnet_ids         = [aws_subnet.saopaulo_prv_subnet_1a.id, aws_subnet.saopaulo_prv_subnet_1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.saopaulo_tgw.id
  vpc_id             = aws_vpc.saopaulo_vpc.id

  tags = {
    Name = "saopaulo_tgw_vpc_att"
  }
}

resource "aws_ec2_transit_gateway_route_table" "saopaulo_tgw_rtb" {
  provider           = aws.saopaulo
  transit_gateway_id = aws_ec2_transit_gateway.saopaulo_tgw.id
}



resource "aws_ec2_transit_gateway_route" "saopaulo_tgw_rte" {
  provider                       = aws.saopaulo
  destination_cidr_block         = aws_vpc.saopaulo_vpc.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.saopaulo_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.saopaulo_tgw_rtb.id
}

resource "aws_ec2_transit_gateway_route_table_association" "saopaulo_rtb_assoc" {
  provider                       = aws.saopaulo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.saopaulo_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.saopaulo_tgw_rtb.id
}


