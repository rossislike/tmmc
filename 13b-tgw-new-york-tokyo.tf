
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "new_york_from_tokyo_att_acceptor" {
  provider                      = aws.nvirginia
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tokyo_to_new_york_tgw_peering_att.id

  tags = {
    Name = "new_york_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_route" "new_york_from_tokyo_tgw_rte" {
  provider                       = aws.nvirginia
  destination_cidr_block         = aws_vpc.tokyo_vpc.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.tokyo_to_new_york_tgw_peering_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.new_york_tgw_rtb.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.tokyo_to_new_york_tgw_peering_att,
    aws_ec2_transit_gateway_peering_attachment_accepter.new_york_from_tokyo_att_acceptor
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "new_york_from_tokyo_tgw_rtb_assoc" {
  provider                       = aws.nvirginia
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.tokyo_to_new_york_tgw_peering_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.new_york_tgw_rtb.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.tokyo_to_new_york_tgw_peering_att,
    aws_ec2_transit_gateway_peering_attachment_accepter.new_york_from_tokyo_att_acceptor
  ]

  lifecycle {
    create_before_destroy = true
  }
}
