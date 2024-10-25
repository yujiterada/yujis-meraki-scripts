module "traffic_shaping_rules" {
  source = "../../modules/meraki/appliance/traffic_shaping_rules/base"
  network_id = var.network_id
}
