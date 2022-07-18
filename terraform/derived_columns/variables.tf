variable "traces_dataset" {
  description = "Dataset to use for traces"
  type        = string
  default     = "ExampleTracesDataset"
}

variable "metrics_dataset" {
  description = "Dataset to use for system metrics"
  type        = string
  default     = "ExampleMetricsDataset"
}
