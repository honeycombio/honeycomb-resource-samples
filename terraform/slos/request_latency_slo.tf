resource "honeycombio_slo" "request_latency_slo" {
  name              = "Latency SLO"
  description       = "Request latency SLO"
  dataset           = var.traces_dataset
  sli               = module.derived_columns.request_latency_sli
  target_percentage = 99.5
  time_period       = 30
}
