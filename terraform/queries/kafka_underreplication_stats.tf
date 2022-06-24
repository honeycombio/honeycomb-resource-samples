data "honeycombio_query_specification" "kafka-underreplication-stats" {
  calculation {
    op     = "SUM"
    column = "replica_manager.UnderReplicatedPartitions"
  }

  calculation {
    op     = "SUM"
    column = "replica_manager.UnderMinIsrPartitionCount"
  }

  calculation {
    op     = "SUM"
    column = "replica_manager.ReassigningPartitions"
  }

  breakdowns = ["kafka_broker_id"]
}

output "kafka-underreplication-stats-json" {
  value = data.honeycombio_query_specification.kafka-underreplication-stats.json
}
