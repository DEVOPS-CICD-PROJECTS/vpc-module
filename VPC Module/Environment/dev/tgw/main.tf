module "tgw" {
  source          = "../../../modules/tgw"
  environment     = "dev"
  region          = "us-west-2"
  vpc-environment = "dev"
  #destination-cidr = "10.0.0.0/16"
}