data "honeycombio_query_specification" "refinery-intercommunication" {
  calculation {
    op     = "MAX"
    column = "incoming_router_batch"
  }

  calculation {
    op     = "MAX"
    column = "peer_router_batch"
  }

  order {
    column = "incoming_router_batch"
    op     = "MAX"
    order  = "descending"
  }

  breakdowns = ["hostname"]
}

output "refinery-intercommunication-query-json" {
  value = data.honeycombio_query_specification.refinery-intercommunication.json
}
