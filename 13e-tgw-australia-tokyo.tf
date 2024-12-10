resource "aws_ec2_transit_gateway_peering_attachment_accepter" "australia_from_tokyo_att_acceptor" {
  provider                      = aws.australia
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tokyo_to_australia_tgw_peering_att.id

  tags = {
    Name = "australia_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_route" "australia_from_tokyo_tgw_rte" {
  provider                       = aws.australia
  destination_cidr_block         = aws_vpc.tokyo_vpc.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.tokyo_to_australia_tgw_peering_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.australia_tgw_rtb.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.tokyo_to_australia_tgw_peering_att,
    aws_ec2_transit_gateway_peering_attachment_accepter.australia_from_tokyo_att_acceptor
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "australia_from_tokyo_tgw_rtb_assoc" {
  provider                       = aws.australia
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.tokyo_to_australia_tgw_peering_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.australia_tgw_rtb.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.tokyo_to_australia_tgw_peering_att,
    aws_ec2_transit_gateway_peering_attachment_accepter.australia_from_tokyo_att_acceptor
  ]

  lifecycle {
    create_before_destroy = true
  }
}
