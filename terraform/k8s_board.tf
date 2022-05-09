data "honeycombio_query_specification" "k8s-metrics-query" {
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


resource "honeycombio_query" "query" {
  dataset    = var.dataset
  query_json = data.honeycombio_query_specification.k8s-metrics-query.json
}

resource "honeycombio_board" "board" {
  name = "k8s-metrics"

  query {
    dataset  = var.dataset
    query_id = honeycombio_query.query.id
  }
}
