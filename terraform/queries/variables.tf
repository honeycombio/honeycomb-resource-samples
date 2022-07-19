variable "traces_dataset" {
  description = "Dataset to use"
  type        = string
  default     = "ExampleTracesDataset"
}

variable "metrics_dataset" {
  description = "Dataset to use"
  type        = string
  default     = "ExampleMetricsDataset"
}

variable "kafka_stats_dataset" {
  description = "Dataset to use for Kafka stats"
  type        = string
  default     = "ExampleKafkaStatsDataset"
}

variable "refinery_metrics_dataset" {
  description = "Dataset to use for refinery metrics"
  type        = string
  default     = "Refinery Metrics"
}
