output "request_latency_sli" {
  value = honeycombio_derived_column.request_latency_sli.alias
}

output "duration_ms_log" {
  value = honeycombio_derived_column.duration_ms_log.alias
}
