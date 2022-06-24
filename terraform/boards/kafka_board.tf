# Query specification outputs
resource "honeycombio_query" "kafka-broker-cpu-util-query" {
  dataset    = var.kafka_stats_dataset
  query_json = module.query.kafka-broker-cpu-util-json
}

resource "honeycombio_query_annotation" "kafka-broker-cpu-util-query" {
  dataset  = var.kafka_stats_dataset
  query_id = honeycombio_query.kafka-broker-cpu-util-query.id
  name     = "k8s namespace cpu and memory usage"
}
resource "honeycombio_query" "kafka-disk-free-query" {
  dataset    = var.kafka_stats_dataset
  query_json = module.query.kafka-disk-free-query-json
}

resource "honeycombio_query_annotation" "kafka-disk-free-query" {
  dataset  = var.kafka_stats_dataset
  query_id = honeycombio_query.kafka-disk-free-query.id
  name     = "k8s node cpu and memory usage"
}

resource "honeycombio_query" "kafka-heap-use-and-gc-query" {
  dataset    = var.kafka_stats_dataset
  query_json = module.query.kafka-heap-use-and-gc-json
}

resource "honeycombio_query_annotation" "kafka-heap-use-and-gc-query" {
  dataset  = var.kafka_stats_dataset
  query_id = honeycombio_query.kafka-heap-use-and-gc-query.id
  name     = "k8s node network traffic"
}

resource "honeycombio_query" "kafka-network-throughput-query" {
  dataset    = var.kafka_stats_dataset
  query_json = module.query.kafka-network-throughput-json
}

resource "honeycombio_query_annotation" "kafka-network-throughput-query" {
  dataset  = var.kafka_stats_dataset
  query_id = honeycombio_query.kafka-network-throughput-query.id
  name     = "k8s pod restarts"
}

resource "honeycombio_query" "kafka-throughput-query" {
  dataset    = var.kafka_stats_dataset
  query_json = module.query.kafka-throughput-query-json
}

resource "honeycombio_query_annotation" "kafka-throughput-query" {
  dataset  = var.kafka_stats_dataset
  query_id = honeycombio_query.kafka-throughput-query.id
  name     = "k8s pod restarts"
}

resource "honeycombio_query" "kafka-underreplication-stats-query" {
  dataset    = var.kafka_stats_dataset
  query_json = module.query.kafka-underreplication-stats-json
}

resource "honeycombio_query_annotation" "kafka-underreplication-stats-query" {
  dataset  = var.kafka_stats_dataset
  query_id = honeycombio_query.kafka-underreplication-stats-query.id
  name     = "k8s pod restarts"
}

# Board definition
resource "honeycombio_board" "kafka-monitoring" {
  name  = "Kafka Monitoring"
  style = "visual"
  query {
    dataset             = var.kafka_stats_dataset
    query_id            = honeycombio_query.kafka-broker-cpu-util-query.id
    query_annotation_id = honeycombio_query_annotation.kafka-broker-cpu-util-query.id

  }

  query {
    dataset             = var.kafka_stats_dataset
    query_id            = honeycombio_query.kafka-disk-free-query.id
    query_annotation_id = honeycombio_query_annotation.kafka-disk-free-query.id
  }

  query {
    dataset             = var.kafka_stats_dataset
    query_id            = honeycombio_query.kafka-heap-use-and-gc-query.id
    query_annotation_id = honeycombio_query_annotation.kafka-heap-use-and-gc-query.id
  }

  query {
    dataset             = var.kafka_stats_dataset
    query_id            = honeycombio_query.kafka-network-throughput-query.id
    query_annotation_id = honeycombio_query_annotation.kafka-network-throughput-query.id
  }

  query {
    dataset             = var.kafka_stats_dataset
    query_id            = honeycombio_query.kafka-throughput-query.id
    query_annotation_id = honeycombio_query_annotation.kafka-throughput-query.id
  }

  query {
    dataset             = var.kafka_stats_dataset
    query_id            = honeycombio_query.kafka-underreplication-stats-query.id
    query_annotation_id = honeycombio_query_annotation.kafka-underreplication-stats-query.id
  }
}
