data "honeycombio_query_specification" "kafka-disk-free" {
  calculation {
    op     = "MIN"
    column = "disk_percent_free"
  }

  filter {
    column = "host_group"
    op     = "="
    value  = "kafka"
  }

  breakdowns = ["hostname"]
}

output "kafka-disk-free-query-json" {
  value = data.honeycombio_query_specification.kafka-disk-free.json
}
