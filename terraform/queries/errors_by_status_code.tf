data "honeycombio_query_specification" "errors-by-status-code" {
  calculation {
    op     = "HEATMAP"
    column = "http.status_code"
  }
}

output "errors-by-status-code-query-json" {
    value = data.honeycombio_query_specification.errors-by-status-code.json
}
