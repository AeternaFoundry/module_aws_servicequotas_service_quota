variable "servicequotas_service_quota" {
  description = <<EOT
Map of servicequotas_service_quota, attributes below
Required:
    - quota_code
    - service_code
    - value
Optional:
    - region
EOT

  type = map(object({
    quota_code   = string
    service_code = string
    value        = number
    region       = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.servicequotas_service_quota : (
        (length(v.quota_code) >= 1 && length(v.quota_code) <= 128) && (can(regex("^[A-Za-z]", v.quota_code))) && (can(regex("^[0-9A-Za-z-]+$", v.quota_code)))
      )
    ])
    error_message = "all of: must be between 1 and 128 characters; must begin with alphabetic character; must contain only alphanumeric and hyphen characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.servicequotas_service_quota : (
        (length(v.service_code) >= 1 && length(v.service_code) <= 63) && (can(regex("^[A-Za-z]", v.service_code))) && (can(regex("^[0-9A-Za-z-]+$", v.service_code)))
      )
    ])
    error_message = "all of: must be between 1 and 63 characters; must begin with alphabetic character; must contain only alphanumeric and hyphen characters"
  }
}

