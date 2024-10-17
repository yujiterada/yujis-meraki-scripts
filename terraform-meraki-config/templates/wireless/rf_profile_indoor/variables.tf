variable "meraki_dashboard_api_key" {
  description = "Meraki Dashboard API key"
  type        = string
  sensitive   = true
}

variable "network_id" {
  description = "ID of the Meraki network"
  type        = string
}

variable "rf_profile_name" {
  description = "Name of the RF profile"
  type        = string
}
