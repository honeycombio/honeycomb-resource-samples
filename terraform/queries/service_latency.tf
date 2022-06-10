data "honeycombio_query_specification" "service-latency" {
  calculation {
    op     = "P95"
    column = "duration_ms"
  }

  calculation {
    op     = "P90"
    column = "duration_ms"
  }

  calculation {
    op     = "P75"
    column = "duration_ms"
  }

  calculation {
    op     = "P50"
    column = "duration_ms"
  }

  calculation {
    op     = "HEATMAP"
    column = "duration_ms"
  }

  filter {
    column = "meta.annotation_type"
    op     = "!="
    value  = "link"
  }

  filter {
    column = "meta.annotation_type"
    op     = "!="
    value  = "span_event"
  }

  breakdowns = ["service.name"]
}

output "service-latency-query-json" {
    value = data.honeycombio_query_specification.service-latency.json
}
