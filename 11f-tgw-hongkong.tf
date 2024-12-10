resource "aws_ec2_transit_gateway" "hongkong_tgw" {
  provider    = aws.hongkong
  description = "hongkong_tgw"

  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]
  default_route_table_propagation = "disable"

  tags = {
    Name = "hongkong_tgw"
  }
}

resource "aws_route" "hongkong_prv_tgw_route" {
  provider               = aws.hongkong
  route_table_id         = aws_route_table.hongkong_prv_rtb.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.hongkong_tgw.id
}



resource "aws_ec2_transit_gateway_vpc_attachment" "hongkong_tgw_vpc_att" {
  provider           = aws.hongkong
  subnet_ids         = [aws_subnet.hongkong_prv_subnet_1a.id, aws_subnet.hongkong_prv_subnet_1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.hongkong_tgw.id
  vpc_id             = aws_vpc.hongkong_vpc.id

  tags = {
    Name = "hongkong_tgw_vpc_att"
  }
}

resource "aws_ec2_transit_gateway_route_table" "hongkong_tgw_rtb" {
  provider           = aws.hongkong
  transit_gateway_id = aws_ec2_transit_gateway.hongkong_tgw.id
}



resource "aws_ec2_transit_gateway_route" "hongkong_tgw_rte" {
  provider                       = aws.hongkong
  destination_cidr_block         = aws_vpc.hongkong_vpc.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.hongkong_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.hongkong_tgw_rtb.id
}

resource "aws_ec2_transit_gateway_route_table_association" "hongkong_rtb_assoc" {
  provider                       = aws.hongkong
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.hongkong_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.hongkong_tgw_rtb.id
}


