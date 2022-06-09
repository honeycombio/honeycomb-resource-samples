module "query" {
  source = "./queries"
}

# Query specification outputs
resource "honeycombio_query" "k8s-namespace-cpu-and-memory-query" {
  dataset    = var.metrics_dataset
  query_json = module.query.k8s-namespace-cpu-and-memory-query-json
}

resource "honeycombio_query_annotation" "k8s-namespace-cpu-and-memory-query" {
  dataset  = var.metrics_dataset
  query_id = honeycombio_query.k8s-namespace-cpu-and-memory-query.id
  name     = "k8s namespace cpu and memory usage"
}
resource "honeycombio_query" "k8s-node-cpu-and-memory-query" {
  dataset    = var.metrics_dataset
  query_json = module.query.k8s-node-cpu-and-memory-query-json
}

resource "honeycombio_query_annotation" "k8s-node-cpu-and-memory-query" {
  dataset  = var.metrics_dataset
  query_id = honeycombio_query.k8s-node-cpu-and-memory-query.id
  name     = "k8s node cpu and memory usage"
}

resource "honeycombio_query" "k8s-node-network-traffic-query" {
  dataset    = var.metrics_dataset
  query_json = module.query.k8s-node-network-traffic-query-json
}

resource "honeycombio_query_annotation" "k8s-node-network-traffic-query" {
  dataset  = var.metrics_dataset
  query_id = honeycombio_query.k8s-node-network-traffic-query.id
  name     = "k8s node network traffic"
}

resource "honeycombio_query" "k8s-pod-restarts-query" {
  dataset    = var.metrics_dataset
  query_json = module.query.k8s-pod-restarts-query-json
}

resource "honeycombio_query_annotation" "k8s-pod-restarts-query" {
  dataset  = var.metrics_dataset
  query_id = honeycombio_query.k8s-pod-restarts-query.id
  name     = "k8s pod restarts"
}

# Board definition
resource "honeycombio_board" "k8s-metrics" {
  name  = "K8s metrics"
  style = "visual"
  query {
    dataset             = var.metrics_dataset
    query_id            = honeycombio_query.k8s-namespace-cpu-and-memory-query.id
    query_annotation_id = honeycombio_query_annotation.k8s-namespace-cpu-and-memory-query.id

  }

  query {
    dataset             = var.metrics_dataset
    query_id            = honeycombio_query.k8s-node-cpu-and-memory-query.id
    query_annotation_id = honeycombio_query_annotation.k8s-node-cpu-and-memory-query.id
  }

  query {
    dataset             = var.metrics_dataset
    query_id            = honeycombio_query.k8s-node-network-traffic-query.id
    query_annotation_id = honeycombio_query_annotation.k8s-node-network-traffic-query.id
  }

  query {
    dataset             = var.metrics_dataset
    query_id            = honeycombio_query.k8s-pod-restarts-query.id
    query_annotation_id = honeycombio_query_annotation.k8s-pod-restarts-query.id
  }
}
