data "honeycombio_query_specification" "db-performance" {
  calculation {
    op     = "COUNT"
  }

  calculation {
    op     = "HEATMAP"
    column = "duration_ms"
  }

  calculation {
    op     = "AVG"
    column = "duration_ms"
  }

  filter {
    column = "db.statement"
    op     = "exists"
  }

  breakdowns = ["db.statement"]
}

output "db-performance-query-json" {
    value = data.honeycombio_query_specification.db-performance.json
}
