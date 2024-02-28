module "stage-dev-route" {
  source           = "../../../modules/tgw-vpc-routes"
  region           = "us-east-2"
  destination-cidr = "11.0.0.0/16"
  vpc-environment  = "stage"
  remote-region    = "us-west-2"
}