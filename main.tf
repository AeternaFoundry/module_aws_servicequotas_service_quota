resource "aws_servicequotas_service_quota" "servicequotas_service_quota" {
  for_each = var.servicequotas_service_quota

  quota_code   = each.value.quota_code
  service_code = each.value.service_code
  value        = each.value.value
  region       = each.value.region
}

