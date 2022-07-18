data "honeycombio_query_specification" "refinery-sampling-decision" {
  calculation {
    op     = "MAX"
    column = "trace_accepted"
  }

  calculation {
    op     = "MAX"
    column = "trace_send_dropped"
  }

  calculation {
    op     = "MAX"
    column = "trace_send_kept"
  }

  order {
    column = "trace_accepted"
    op     = "MAX"
    order  = "descending"
  }

  breakdowns = ["hostname"]
}

output "refinery-sampling-decision-query-json" {
  value = data.honeycombio_query_specification.refinery-sampling-decision.json
}
