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
