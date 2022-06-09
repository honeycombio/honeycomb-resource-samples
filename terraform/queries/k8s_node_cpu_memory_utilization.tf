data "honeycombio_query_specification" "k8s-node-cpu-and-memory" {
  calculation {
    op     = "AVG"
    column = "metrics.cpu.usage"
  }

  calculation {
    op     = "AVG"
    column = "metrics.memory.usage"
  }

  filter {
    column = "k8s.resource.type"
    op     = "="
    value  = "node"
  }

  breakdowns = ["k8s.node.name"]

  order {
    column = "metrics.cpu.usage"
    op     = "AVG"
    order  = "descending"
  }
}

output "k8s-node-cpu-and-memory-query-json" {
    value = data.honeycombio_query_specification.k8s-node-cpu-and-memory.json
}
