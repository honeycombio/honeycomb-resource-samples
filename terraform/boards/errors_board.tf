# Query specification outputs
resource "honeycombio_query" "service-errors-query" {
  dataset    = var.traces_dataset
  query_json = module.query.service-errors-query-json
}

resource "honeycombio_query_annotation" "service-errors-query" {
  dataset  = var.traces_dataset
  query_id = honeycombio_query.service-errors-query.id
  name     = "Errors by service"
}
resource "honeycombio_query" "errors-by-status-code-query" {
  dataset    = var.traces_dataset
  query_json = module.query.errors-by-status-code-query-json
}

resource "honeycombio_query_annotation" "errors-by-status-code-query" {
  dataset  = var.traces_dataset
  query_id = honeycombio_query.errors-by-status-code-query.id
  name     = "Errors by status code"
}

resource "honeycombio_query" "errors-by-version-query" {
  dataset    = var.traces_dataset
  query_json = module.query.errors-by-version-query-json
}

resource "honeycombio_query_annotation" "errors-by-version-query" {
  dataset  = var.traces_dataset
  query_id = honeycombio_query.errors-by-version-query.id
  name     = "Errors by version"
}


# Board definition
resource "honeycombio_board" "errors" {
  name  = "Errors Overview"
  style = "visual"
  query {
    dataset             = var.traces_dataset
    query_id            = honeycombio_query.service-errors-query.id
    query_annotation_id = honeycombio_query_annotation.service-errors-query.id

  }

  query {
    dataset             = var.traces_dataset
    query_id            = honeycombio_query.errors-by-status-code-query.id
    query_annotation_id = honeycombio_query_annotation.errors-by-status-code-query.id
  }

  query {
    dataset             = var.traces_dataset
    query_id            = honeycombio_query.errors-by-version-query.id
    query_annotation_id = honeycombio_query_annotation.errors-by-version-query.id
  }
}
