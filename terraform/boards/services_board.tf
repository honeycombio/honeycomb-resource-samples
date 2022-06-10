# Query specification outputs
resource "honeycombio_query" "db-performance-query" {
  dataset    = var.traces_dataset
  query_json = module.query.db-performance-query-json
}

resource "honeycombio_query_annotation" "db-performance-query" {
  dataset  = var.traces_dataset
  query_id = honeycombio_query.db-performance-query.id
  name     = "Database query performance"
}
resource "honeycombio_query" "requests-by-endpoint-query" {
  dataset    = var.traces_dataset
  query_json = module.query.requests-by-endpoint-query-json
}

resource "honeycombio_query_annotation" "requests-by-endpoint-query" {
  dataset  = var.traces_dataset
  query_id = honeycombio_query.requests-by-endpoint-query.id
  name     = "Request count and duration by endpoint"
}

resource "honeycombio_query" "service-latency-query" {
  dataset    = var.traces_dataset
  query_json = module.query.service-latency-query-json
}

resource "honeycombio_query_annotation" "service-latency-query" {
  dataset  = var.traces_dataset
  query_id = honeycombio_query.service-latency-query.id
  name     = "Latency by service"
}

resource "honeycombio_query" "duration-by-version-query" {
  dataset    = var.traces_dataset
  query_json = module.query.duration-by-version-query-json
}

resource "honeycombio_query_annotation" "duration-by-version-query" {
  dataset  = var.traces_dataset
  query_id = honeycombio_query.duration-by-version-query.id
  name     = "Latency by service version"
}

resource "honeycombio_query" "service-requests-query" {
  dataset    = var.traces_dataset
  query_json = module.query.service-requests-query-json
}

resource "honeycombio_query_annotation" "service-requests-query" {
  dataset  = var.traces_dataset
  query_id = honeycombio_query.service-requests-query.id
  name     = "Service request count"
}


# Board definition
resource "honeycombio_board" "services" {
  name  = "Services Overview"
  style = "visual"
  query {
    dataset             = var.traces_dataset
    query_id            = honeycombio_query.db-performance-query.id
    query_annotation_id = honeycombio_query_annotation.db-performance-query.id

  }

  query {
    dataset             = var.traces_dataset
    query_id            = honeycombio_query.requests-by-endpoint-query.id
    query_annotation_id = honeycombio_query_annotation.requests-by-endpoint-query.id
  }

  query {
    dataset             = var.traces_dataset
    query_id            = honeycombio_query.service-latency-query.id
    query_annotation_id = honeycombio_query_annotation.service-latency-query.id
  }

  query {
    dataset             = var.traces_dataset
    query_id            = honeycombio_query.duration-by-version-query.id
    query_annotation_id = honeycombio_query_annotation.duration-by-version-query.id
  }

  query {
    dataset             = var.traces_dataset
    query_id            = honeycombio_query.service-requests-query.id
    query_annotation_id = honeycombio_query_annotation.service-requests-query.id
  }
}
