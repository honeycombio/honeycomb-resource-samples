data "honeycombio_query_specification" "kafka-heap-use-and-gc" {
  calculation {
    op     = "MAX"
    column = "java.HeapMemoryUsage.used"
  }

  calculation {
    op     = "RATE_MAX"
    column = "java.GCCollectionTime"
  }

  breakdowns = ["kafka_broker_id"]

  order {
    column = "kafka_broker_id"
    order  = "descending"
  }
}

output "kafka-heap-use-and-gc-json" {
  value = data.honeycombio_query_specification.kafka-heap-use-and-gc.json
}
