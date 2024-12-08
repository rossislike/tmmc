# Asia-Pacific Transit Gateway (APAC) - Consolidating Tokyo, Hong Kong, Sydney
resource "aws_ec2_transit_gateway" "tgw_apac" {
  provider = aws.tokyo
  description = "Transit Gateway for APAC regions (Tokyo, Hong Kong, Sydney)"
}

resource "aws_ec2_transit_gateway" "tgw_hongkong" {
  provider = aws.hongkong
  description = "Transit Gateway for Hong Kong"
}

resource "aws_ec2_transit_gateway" "tgw_australia" {
  provider = aws.australia
  description = "Transit Gateway for Sydney"
}

# Americas Transit Gateway - Consolidating New York and California
resource "aws_ec2_transit_gateway" "tgw_americas" {
  provider = aws.nvirginia
  description = "Transit Gateway for Americas regions (New York, California)"
}

# Europe Transit Gateway - London
resource "aws_ec2_transit_gateway" "tgw_europe" {
  provider = aws.london
  description = "Transit Gateway for London"
}

# São Paulo Transit Gateway - Dedicated
resource "aws_ec2_transit_gateway" "tgw_saopaulo" {
  provider = aws.saopaulo
  description = "Dedicated Transit Gateway for São Paulo"
}



# Inter-region peering connection from ap-northeast-1 (Tokyo) to us-east-1 (New York)
resource "aws_ec2_transit_gateway_peering_attachment" "ap_northeast_1_to_us_east_1" {
  provider                = aws.tokyo
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_apac.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_americas.id
  peer_region             = "us-east-1"
}

# Inter-region peering connection from us-east-1 (New York) to eu-west-2 (London)
resource "aws_ec2_transit_gateway_peering_attachment" "us_east_1_to_eu_west_2" {
  provider                = aws.nvirginia
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_americas.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_europe.id
  peer_region             = "eu-west-2"
}

# Inter-region peering connection from eu-west-2 (London) to sa-east-1 (Sao Paulo)
resource "aws_ec2_transit_gateway_peering_attachment" "eu_west_2_to_sa_east_1" {
  provider                = aws.london
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_europe.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_saopaulo.id
  peer_region             = "sa-east-1"
}

# Inter-region peering connection from sa-east-1 (Sao Paulo) to ap-southeast-2 (Sydney)
resource "aws_ec2_transit_gateway_peering_attachment" "sa_east_1_to_ap_southeast_2" {
  provider                = aws.saopaulo
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_saopaulo.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_australia.id
  peer_region             = "ap-southeast-2"
}

# Inter-region peering connection from ap-southeast-2 (Sydney) to ap-east-1 (Hong Kong)
resource "aws_ec2_transit_gateway_peering_attachment" "ap_southeast_2_to_ap_east_1" {
  provider                = aws.australia
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_australia.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_hongkong.id
  peer_region             = "ap-east-1"
}

# Inter-region peering connection from ap-east-1 (Hong Kong) to us-west-1 (California)
resource "aws_ec2_transit_gateway_peering_attachment" "ap_east_1_to_us_west_1" {
  provider                = aws.hongkong
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_hongkong.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_americas.id
  peer_region             = "us-west-1"
}

# Inter-region peering connection from us-west-1 (California) to ap-northeast-1 (Tokyo)
resource "aws_ec2_transit_gateway_peering_attachment" "us_west_1_to_ap_northeast_1" {
  provider                = aws.california
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_americas.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_apac.id
  peer_region             = "ap-northeast-1"
}

# Peering attachment accepter from ap-northeast-1 (Tokyo) to us-east-1 (New York)
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_ap_northeast_1_to_us_east_1" {
  provider                      = aws.tokyo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ap_northeast_1_to_us_east_1.id
}

# Peering attachment accepter from us-east-1 (New York) to eu-west-2 (London)
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_us_east_1_to_eu_west_2" {
  provider                      = aws.nvirginia
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.us_east_1_to_eu_west_2.id
}

# Peering attachment accepter from eu-west-2 (London) to sa-east-1 (Sao Paulo)
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_eu_west_2_to_sa_east_1" {
  provider                      = aws.london
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.eu_west_2_to_sa_east_1.id
}

# Peering attachment accepter from sa-east-1 (Sao Paulo) to ap-southeast-2 (Sydney)
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_sa_east_1_to_ap_southeast_2" {
  provider                      = aws.saopaulo
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.sa_east_1_to_ap_southeast_2.id
}

# Peering attachment accepter from ap-southeast-2 (Sydney) to ap-east-1 (Hong Kong)
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_ap_southeast_2_to_ap_east_1" {
  provider                      = aws.australia
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ap_southeast_2_to_ap_east_1.id
}

# Peering attachment accepter from ap-east-1 (Hong Kong) to us-west-1 (California)
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_ap_east_1_to_us_west_1" {
  provider                      = aws.hongkong
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ap_east_1_to_us_west_1.id
}

# Peering attachment accepter from us-west-1 (California) to ap-northeast-1 (Tokyo)
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_us_west_1_to_ap_northeast_1" {
  provider                      = aws.california
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.us_west_1_to_ap_northeast_1.id
}
