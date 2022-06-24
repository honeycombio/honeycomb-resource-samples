data "honeycombio_query_specification" "requests-by-endpoint" {
  calculation {
    op = "COUNT"
  }

  calculation {
    op     = "HEATMAP"
    column = "duration_ms"
  }

  filter {
    column = "http.target"
    op     = "exists"
  }

  breakdowns = ["http.target"]

  order {
    op    = "COUNT"
    order = "descending"
  }
}

output "requests-by-endpoint-query-json" {
  value = data.honeycombio_query_specification.requests-by-endpoint.json
}
