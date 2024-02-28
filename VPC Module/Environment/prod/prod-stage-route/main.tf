module "tgw-vpc-route" {
  source           = "../../../modules/tgw-vpc-routes"
  vpc-environment  = "prod"
  region           = "us-west-1"
  destination-cidr = "12.0.0.0/16"
  remote-region    = "us-east-2"
}