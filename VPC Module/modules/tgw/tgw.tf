
provider "aws" {
  alias  = "remote"
  region = var.region
}

data "aws_vpc" "vpc" {
  provider = aws.remote
  tags = {
    Name = "${var.vpc-environment}-vpc"
  }
}

data "aws_subnets" "subnet" {
  provider = aws.remote
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  tags = {
    "Name" = "public"
  }
}

# 1. Transit gateway
resource "aws_ec2_transit_gateway" "tgw" {
  provider                    = aws.remote
  description                 = "Transit Gateway for ${var.environment}"
  amazon_side_asn             = 64512
  transit_gateway_cidr_blocks = null

  tags = {
    Name = "${var.environment}-TGW"
  }
}

#2. TGW VPC Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  provider           = aws.remote
  subnet_ids         = data.aws_subnets.subnet.ids
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = data.aws_vpc.vpc.id
}
