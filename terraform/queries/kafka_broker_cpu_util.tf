data "honeycombio_query_specification" "kafka-broker-cpu-util" {
  calculation {
    op     = "MAX"
    column = "cpu_util"
  }

  filter {
    column = "host_group"
    op     = "="
    value  = "kafka"
  }

  breakdowns = ["hostname"]
}

output "kafka-broker-cpu-util-json" {
  value = data.honeycombio_query_specification.kafka-broker-cpu-util.json
}
