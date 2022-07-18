data "honeycombio_query_specification" "refinery-sample-rates" {
  calculation {
    op     = "HEATMAP"
    column = "dynsampler_sample_rate_max"
  }

  calculation {
    op     = "HEATMAP"
    column = "dynsampler_sample_rate_p95"
  }

  calculation {
    op     = "HEATMAP"
    column = "dynsampler_sample_rate_avg"
  }

  calculation {
    op     = "HEATMAP"
    column = "dynsampler_sample_rate_min"
  }
}

output "refinery-sample-rates-query-json" {
  value = data.honeycombio_query_specification.refinery-sample-rates.json
}
