module "tgw" {
  source          = "../../../modules/tgw"
  environment     = "prod"
  region          = "us-west-1"
  vpc-environment = "prod"
}