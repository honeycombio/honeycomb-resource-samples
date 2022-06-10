data "honeycombio_query_specification" "k8s-node-network-traffic" {
  calculation {
    op     = "AVG"
    column = "metrics.network.bytes.send"
  }

  calculation {
    op     = "AVG"
    column = "metrics.network.bytes.receive"
  }

  filter {
    column = "k8s.resource.type"
    op     = "="
    value  = "node"
  }

  breakdowns = ["k8s.node.name"]

  order {
    column = "metrics.network.bytes.send"
    op     = "AVG"
    order  = "descending"
  }
}

output "k8s-node-network-traffic-query-json" {
    value = data.honeycombio_query_specification.k8s-node-network-traffic.json
}

