resource "honeycombio_derived_column" "request_latency_sli" {
  alias       = "request_latency"
  description = "SLI: request latency less than 300ms"
  dataset     = var.traces_dataset
  expression  = "IF(AND(EQUALS($service.name, \"frontend\"), NOT(EXISTS($trace.parent_id))), LT($duration_ms, 300))"
}
