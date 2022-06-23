data "honeycombio_query_specification" "service-errors" {
  calculation {
    op = "COUNT"
  }

  filter {
    column = "error"
    op     = "="
    value  = "true"
  }

  breakdowns = ["service.name", "http.status_code", "status_message"]
}

output "service-errors-query-json" {
  value = data.honeycombio_query_specification.service-errors.json
}
