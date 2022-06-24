data "honeycombio_query_specification" "kafka-throughput" {
  calculation {
    op     = "AVG"
    column = "broker_topic_metrics.MessagesInPerSec"
  }

  breakdowns = ["kafka_broker_id", "hostname"]
}

output "kafka-throughput-query-json" {
  value = data.honeycombio_query_specification.kafka-throughput.json
}
