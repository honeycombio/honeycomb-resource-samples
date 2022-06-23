data "honeycombio_query_specification" "duration-by-version" {
  calculation {
    op     = "AVG"
    column = "duration_ms"
  }

  calculation {
    op     = "HEATMAP"
    column = "duration_ms"
  }

  breakdowns = ["service.version"]
}

output "duration-by-version-query-json" {
  value = data.honeycombio_query_specification.duration-by-version.json
}
