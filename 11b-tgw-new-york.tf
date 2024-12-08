resource "aws_ec2_transit_gateway" "new_york_tgw" {
  provider    = aws.nvirginia
  description = "new_york_tgw"

  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]
  default_route_table_propagation = "disable"

  tags = {
    Name = "new_york_tgw"
  }
}

resource "aws_route" "new_york_prv_tgw_route" {
  provider               = aws.nvirginia
  route_table_id         = aws_route_table.new_york_prv_rtb.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.new_york_tgw.id
}



resource "aws_ec2_transit_gateway_vpc_attachment" "new_york_tgw_vpc_att" {
  provider           = aws.nvirginia
  subnet_ids         = [aws_subnet.new_york_prv_subnet_1a.id, aws_subnet.new_york_prv_subnet_1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.new_york_tgw.id
  vpc_id             = aws_vpc.new_york_vpc.id

  tags = {
    Name = "new_york_tgw_vpc_att"
  }
}

resource "aws_ec2_transit_gateway_route_table" "new_york_tgw_rtb" {
  provider           = aws.nvirginia
  transit_gateway_id = aws_ec2_transit_gateway.new_york_tgw.id
}



resource "aws_ec2_transit_gateway_route" "new_york_tgw_rte" {
  provider                       = aws.nvirginia
  destination_cidr_block         = aws_vpc.new_york_vpc.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.new_york_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.new_york_tgw_rtb.id
}

resource "aws_ec2_transit_gateway_route_table_association" "new_york_rtb_assoc" {
  provider                       = aws.nvirginia
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.new_york_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.new_york_tgw_rtb.id
}


