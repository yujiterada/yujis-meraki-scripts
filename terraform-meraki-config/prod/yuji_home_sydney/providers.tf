terraform {
  required_providers {
    meraki = {
      source  = "cisco-open/meraki"
      version = "0.2.12-alpha"
    }
  }

  backend "s3" {
    bucket         = "s3-yuji-meraki-scripts"
    key            = "state/terraform.tfstate"
    encrypt        = true
    region         = "ap-southeast-2"
  }
}

provider "meraki" {
  meraki_dashboard_api_key = var.meraki_dashboard_api_key
  meraki_debug = true
}
