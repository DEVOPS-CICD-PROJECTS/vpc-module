# Dev-Prod TGW Pairing

module "tgw-peering" {
  source      = "../../../modules/Tgw-Peering"
  local-tgw   = "dev-TGW"
  peer-tgw    = "prod-TGW"
  my-region   = "us-west-2"
  peer-region = "us-west-1"
}