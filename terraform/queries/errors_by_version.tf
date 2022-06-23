data "honeycombio_query_specification" "errors-by-version" {
  calculation {
    op = "COUNT"
  }

  calculation {
    op     = "AVG"
    column = "duration_ms"
  }

  filter {
    column = "error"
    op     = "="
    value  = "true"
  }

  breakdowns = ["service.version"]
}

output "errors-by-version-query-json" {
  value = data.honeycombio_query_specification.errors-by-version.json
}
