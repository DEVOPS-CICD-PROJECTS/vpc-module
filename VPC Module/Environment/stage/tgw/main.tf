module "tgw" {
  source          = "../../../modules/tgw"
  environment     = "prod"
  region          = "us-east-2"
  vpc-environment = "stage"
}