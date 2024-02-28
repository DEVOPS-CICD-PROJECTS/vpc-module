# Prod-Stage TGW Pairing

module "tgw-peering" {
  source      = "../../../modules/Tgw-Peering"
  local-tgw   = "prod-TGW"
  peer-tgw    = "stage-TGW"
  my-region   = "us-west-1"
  peer-region = "us-east-2"
}