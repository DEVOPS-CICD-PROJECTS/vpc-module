provider "aws" {
  alias  = "local"
  region = var.region
}

provider "aws" {
  alias  = "remote"
  region = var.remote-region
}

data "aws_vpc" "vpc" {
  provider = aws.local
  tags = {
    Name = "${var.vpc-environment}-vpc"
  }
}

data "aws_subnets" "subnet" {
  provider = aws.local
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  tags = {
    "Name" = "public"
  }
}

data "aws_ec2_transit_gateway" "local" {
  provider = aws.local
}

data "aws_ec2_transit_gateway" "remote" {
  provider = aws.remote
}

data "aws_ec2_transit_gateway_route_table" "local" {
  provider = aws.local
}

data "aws_route_table" "local" {
  provider = aws.local
  tags = {
    "Name" = "public"
  }
}

data "aws_ec2_transit_gateway_attachment" "local" {
  provider = aws.local
  filter {
    name   = "resource-type"
    values = ["peering"]
  }
  filter {
    name   = "resource-id"
    values = [data.aws_ec2_transit_gateway.remote.id]
  }
}


# TGW Route
resource "aws_ec2_transit_gateway_route" "tgw-rt" {
  provider                       = aws.local
  destination_cidr_block         = var.destination-cidr
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_attachment.local.id
  transit_gateway_route_table_id = data.aws_ec2_transit_gateway_route_table.local.id
}

# VPC Route
resource "aws_route" "r-table" {
  provider               = aws.local
  route_table_id         = data.aws_route_table.local.id
  destination_cidr_block = var.destination-cidr
  transit_gateway_id     = data.aws_ec2_transit_gateway.local.id

}