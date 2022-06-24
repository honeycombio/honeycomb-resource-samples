data "honeycombio_query_specification" "k8s-pod-restarts" {
  calculation {
    op     = "SUM"
    column = "status.restart_delta"
  }

  filter {
    column = "k8s.resource.type"
    op     = "="
    value  = "pod"
  }

  breakdowns = ["k8s.pod.name"]

  order {
    column = "status.restart_delta"
    op     = "SUM"
    order  = "descending"
  }
}

output "k8s-pod-restarts-query-json" {
  value = data.honeycombio_query_specification.k8s-pod-restarts.json
}
