output "rf_profile_id" {
  value = meraki_networks_wireless_rf_profiles.rf_profile_template.id
  description = "The ID of the created RF profile"
}
