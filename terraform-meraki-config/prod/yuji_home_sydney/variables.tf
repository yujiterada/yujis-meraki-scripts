variable "meraki_dashboard_api_key" {
  description = "Meraki Dashboard API key"
  type        = string
  sensitive   = true
}

variable "organization_id" {
  description = "Meraki organization ID"
  type        = string
}

variable "network_id" {
  description = "Meraki network ID"
  type        = string
}