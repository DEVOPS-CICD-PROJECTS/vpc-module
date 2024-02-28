module "stage-prod-route" {
  source           = "../../../modules/tgw-vpc-routes"
  vpc-environment  = "stage"
  region           = "us-east-2"
  destination-cidr = "10.0.0.0/16"
  remote-region    = "us-west-1"
}