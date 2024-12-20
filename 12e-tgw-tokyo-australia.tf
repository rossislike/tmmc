
resource "aws_ec2_transit_gateway_peering_attachment" "tokyo_to_australia_tgw_peering_att" {
  provider                = aws.tokyo
  peer_region             = "ap-southeast-2"
  peer_transit_gateway_id = aws_ec2_transit_gateway.australia_tgw.id
  transit_gateway_id      = aws_ec2_transit_gateway.tokyo_tgw.id

  tags = {
    Name = "tokyo_to_australia"
  }
}

resource "aws_ec2_transit_gateway_route" "tokyo_to_australia_tgw_rte" {
  provider                       = aws.tokyo
  destination_cidr_block         = aws_vpc.australia_vpc.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.tokyo_to_australia_tgw_peering_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo_tgw_rtb.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.tokyo_to_australia_tgw_peering_att,
    aws_ec2_transit_gateway_peering_attachment_accepter.australia_from_tokyo_att_acceptor
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo_to_australia_tgw_rtb_assoc" {
  provider                       = aws.tokyo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.tokyo_to_australia_tgw_peering_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo_tgw_rtb.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.tokyo_to_australia_tgw_peering_att,
    aws_ec2_transit_gateway_peering_attachment_accepter.australia_from_tokyo_att_acceptor
  ]

  lifecycle {
    create_before_destroy = true
  }
}