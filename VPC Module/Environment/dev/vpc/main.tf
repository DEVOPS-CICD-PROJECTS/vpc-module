module "vpc" {
  source             = "../../../modules/vpc"
  environment        = "dev"
  region             = "us-east-1"
  availability_zones = ["us-east-1a", "us-east-1b"]
  cidr_block         = "11.0.0.0/16"
  private_cidr       = ["11.0.0.0/19", "11.0.32.0/19"]
  public_cidr        = ["11.0.64.0/19", "11.0.96.0/19"]
  log_destination      = ""
  log_destination_type = "s3"
}