data "honeycombio_query_specification" "kafka-network-throughput" {
  calculation {
    op     = "AVG"
    column = "broker_topic_metrics.BytesInPerSec"
  }

  calculation {
    op     = "AVG"
    column = "broker_topic_metrics.BytesOutPerSec"
  }

  breakdowns = ["hostname", "kafka_broker_id"]

  order {
    column = "kafka_broker_id"
    order  = "descending"
  }
}

output "kafka-network-throughput-json" {
  value = data.honeycombio_query_specification.kafka-network-throughput.json
}
