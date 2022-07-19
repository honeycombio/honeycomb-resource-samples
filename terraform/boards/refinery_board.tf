# Query specification outputs
resource "honeycombio_query" "refinery-health-query" {
  dataset    = var.refinery_metrics_dataset
  query_json = module.query.refinery-health-query-json
}

resource "honeycombio_query_annotation" "refinery-health-query" {
  dataset     = var.refinery_metrics_dataset
  query_id    = honeycombio_query.refinery-health-query.id
  name        = "Cache Health"
  description = "Overruns above 0 could mean needing to increase cache capacity. Memory at ~80% usage, the cache will be downsized to stop OOM's and thus could lead to overruns with a smaller capacity. cached_entries_max should give an idea about how many entries steady state in the cache."
}
resource "honeycombio_query" "refinery-intercommunication-query" {
  dataset    = var.refinery_metrics_dataset
  query_json = module.query.refinery-intercommunication-query-json
}

resource "honeycombio_query_annotation" "refinery-intercommunication-query" {
  dataset     = var.refinery_metrics_dataset
  query_id    = honeycombio_query.refinery-intercommunication-query.id
  name        = "Intercommunications"
  description = "Incoming are events from outside the cluster in. Peer is communication between nodes."
}

resource "honeycombio_query" "refinery-sample-rates-query" {
  dataset    = var.refinery_metrics_dataset
  query_json = module.query.refinery-sample-rates-query-json
}

resource "honeycombio_query_annotation" "refinery-sample-rates-query" {
  dataset     = var.refinery_metrics_dataset
  query_id    = honeycombio_query.refinery-sample-rates-query.id
  name        = "Sample Rates"
  description = "Sample rates for the entire system."
}

resource "honeycombio_query" "refinery-trace-indicators-query" {
  dataset    = var.refinery_metrics_dataset
  query_json = module.query.refinery-trace-indicators-query-json
}

resource "honeycombio_query_annotation" "refinery-trace-indicators-query" {
  dataset     = var.refinery_metrics_dataset
  query_id    = honeycombio_query.refinery-trace-indicators-query.id
  name        = "Trace Indicators"
  description = "Cache hits means a span belonging to a trace that had already been sent. No Roots are traces are being sent before they are completed so Check out overruns or if a node shutdown recently if you see a lot of no roots."
}

resource "honeycombio_query" "refinery-sampling-decision-query" {
  dataset    = var.refinery_metrics_dataset
  query_json = module.query.refinery-sampling-decision-query-json
}

resource "honeycombio_query_annotation" "refinery-sampling-decision-query" {
  dataset     = var.refinery_metrics_dataset
  query_id    = honeycombio_query.refinery-sampling-decision-query.id
  name        = "Sampling Decisions"
  description = "How many traces are coming in and sent/dropped."
}


# Board definition
resource "honeycombio_board" "refinery" {
  name  = "Refinery Overview"
  style = "visual"
  query {
    dataset             = var.refinery_metrics_dataset
    query_id            = honeycombio_query.refinery-health-query.id
    query_annotation_id = honeycombio_query_annotation.refinery-health-query.id

  }

  query {
    dataset             = var.refinery_metrics_dataset
    query_id            = honeycombio_query.refinery-intercommunication-query.id
    query_annotation_id = honeycombio_query_annotation.refinery-intercommunication-query.id
  }

  query {
    dataset             = var.refinery_metrics_dataset
    query_id            = honeycombio_query.refinery-sample-rates-query.id
    query_annotation_id = honeycombio_query_annotation.refinery-sample-rates-query.id
  }

  query {
    dataset             = var.refinery_metrics_dataset
    query_id            = honeycombio_query.refinery-trace-indicators-query.id
    query_annotation_id = honeycombio_query_annotation.refinery-trace-indicators-query.id
  }

  query {
    dataset             = var.refinery_metrics_dataset
    query_id            = honeycombio_query.refinery-sampling-decision-query.id
    query_annotation_id = honeycombio_query_annotation.refinery-sampling-decision-query.id
  }
}
