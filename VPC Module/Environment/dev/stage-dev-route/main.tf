module "tgw-vpc-route" {
  source           = "../../../modules/tgw-vpc-routes"
  vpc-environment  = "dev"
  region           = "us-west-2"
  destination-cidr = "12.0.0.0/16"
  remote-region    = "us-east-2"
}