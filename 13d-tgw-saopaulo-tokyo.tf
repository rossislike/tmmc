resource "aws_ec2_transit_gateway_peering_attachment_accepter" "saopaulo_from_tokyo_att_acceptor" {
  provider                      = aws.saopaulo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tokyo_to_saopaulo_tgw_peering_att.id

  tags = {
    Name = "saopaulo_to_tokyo"
  }
}

resource "aws_ec2_transit_gateway_route" "saopaulo_from_tokyo_tgw_rte" {
  provider                       = aws.saopaulo
  destination_cidr_block         = aws_vpc.tokyo_vpc.cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.tokyo_to_saopaulo_tgw_peering_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.saopaulo_tgw_rtb.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.tokyo_to_saopaulo_tgw_peering_att,
    aws_ec2_transit_gateway_peering_attachment_accepter.saopaulo_from_tokyo_att_acceptor
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "saopaulo_from_tokyo_tgw_rtb_assoc" {
  provider                       = aws.saopaulo
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.tokyo_to_saopaulo_tgw_peering_att.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.saopaulo_tgw_rtb.id

  depends_on = [
    aws_ec2_transit_gateway_peering_attachment.tokyo_to_saopaulo_tgw_peering_att,
    aws_ec2_transit_gateway_peering_attachment_accepter.saopaulo_from_tokyo_att_acceptor
  ]

  lifecycle {
    create_before_destroy = true
  }
}
