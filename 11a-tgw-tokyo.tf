resource "aws_ec2_transit_gateway" "tokyo_tgw" {
  provider    = aws.tokyo
  description = "tokyo_tgw"

  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "disable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]
  default_route_table_propagation = "disable"

  tags = {
    Name = "tokyo_tgw"
  }
}

resource "aws_route" "tokyo_pub_tgw_route" {
  provider               = aws.tokyo
  route_table_id         = aws_route_table.tokyo_pub_rtb.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.tokyo_tgw.id
}

resource "aws_route" "tokyo_prv_tgw_route" {
  provider               = aws.tokyo
  route_table_id         = aws_route_table.tokyo_prv_rtb.id
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = aws_ec2_transit_gateway.tokyo_tgw.id
}



resource "aws_ec2_transit_gateway_vpc_attachment" "tokyo_tgw_vpc_att" {
  provider           = aws.tokyo
  subnet_ids         = [aws_subnet.tokyo_prv_subnet_1c.id, aws_subnet.tokyo_prv_subnet_1a.id]
  transit_gateway_id = aws_ec2_transit_gateway.tokyo_tgw.id
  vpc_id             = aws_vpc.tokyo_vpc.id

  tags = {
    Name = "tokyo_tgw_vpc_att"
  }
}

resource "aws_ec2_transit_gateway_route_table" "tokyo_tgw_rtb" {
  provider           = aws.tokyo
  transit_gateway_id = aws_ec2_transit_gateway.tokyo_tgw.id
}



resource "aws_ec2_transit_gateway_route" "tokyo_tgw_vpc_rte" {
  provider                       = aws.tokyo
  destination_cidr_block         = aws_vpc.tokyo_vpc.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tokyo_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo_tgw_rtb.id

  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.tokyo_tgw_vpc_att
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo_rtb_assoc" {
  provider                       = aws.tokyo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tokyo_tgw_vpc_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo_tgw_rtb.id
}

