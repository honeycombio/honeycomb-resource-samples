data "honeycombio_query_specification" "service-requests" {
  calculation {
    op     = "COUNT"
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

output "service-requests-query-json" {
    value = data.honeycombio_query_specification.service-requests.json
}
