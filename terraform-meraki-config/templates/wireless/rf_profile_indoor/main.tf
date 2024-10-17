resource "meraki_networks_wireless_rf_profiles" "rf_profile_template" {
  name       = var.rf_profile_name
  network_id = var.network_id

  ap_band_settings = {
    band_operation_mode   = "dual"
    band_steering_enabled = false
    bands = {
      enabled = ["2.4", "5"]
    }
  }

  band_selection_type      = "ssid"
  client_balancing_enabled = false
  min_bitrate_type         = "band"

  two_four_ghz_settings = {
    ax_enabled          = true
    max_power           = 30
    min_power           = 5
    min_bitrate         = 11.0
    rxsop               = null
    valid_auto_channels = [1, 6, 11]
  }

  five_ghz_settings = {
    channel_width       = "40"
    min_power           = 8
    max_power           = 30
    min_bitrate         = 12
    rxsop               = null
    valid_auto_channels = [36, 40, 44, 48, 52, 56, 60, 64, 100, 104, 108, 112, 116, 120, 124, 128, 132, 136, 140, 144, 149, 153, 157, 161, 165]
  }

  six_ghz_settings = {
    channel_width       = "160"
    min_power           = 8
    max_power           = 30
    min_bitrate         = 12
    rxsop               = null
    valid_auto_channels = [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 97, 101, 105, 109, 113, 117, 121, 125, 129, 133, 137, 141, 145, 149, 153, 157, 161, 165, 169, 173, 177, 181, 185, 189, 193, 197, 201, 205, 209, 213, 217, 221, 225, 229, 233]
  }

  transmission = {
    enabled = true
  }

  flex_radios = {
    by_model = [
      {
        bands = ["6"]
        model = "MR57"
      },
      {
        bands = ["6"]
        model = "CW9166I"
      },
      {
        bands = ["6"]
        model = "CW9166D1"
      }
    ]
  }

  per_ssid_settings = {
    status_0 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_1 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_2 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_3 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_4 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_5 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_6 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_7 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_8 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_9 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_10 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_11 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_12 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_13 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }

    status_14 = {
      band_operation_mode   = "dual"
      band_steering_enabled = false
      bands = {
        enabled = ["2.4", "5"]
      }
      min_bitrate = 11.0
    }
  }
}