module "prod-dev-route" {
  source           = "../../../modules/tgw-vpc-routes"
  region           = "us-west-1"
  destination-cidr = "11.0.0.0/16"
  vpc-environment  = "prod"
  remote-region    = "us-west-2"
}