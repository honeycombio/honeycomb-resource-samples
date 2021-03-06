data "honeycombio_query_specification" "refinery-trace-indicators" {
  calculation {
    op     = "SUM"
    column = "trace_sent_cache_hit"
  }

  calculation {
    op     = "SUM"
    column = "trace_send_no_root"
  }
}

output "refinery-trace-indicators-query-json" {
  value = data.honeycombio_query_specification.refinery-trace-indicators.json
}
