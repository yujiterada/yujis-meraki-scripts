terraform {
  required_providers {
    meraki = {
      source  = "cisco-open/meraki"
      version = "0.2.11-alpha"
    }
  }
}

provider "meraki" {
  meraki_dashboard_api_key = var.meraki_dashboard_api_key
}
