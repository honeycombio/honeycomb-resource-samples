# Terraform configuration

terraform {
  required_providers {
    honeycombio = {
      source  = "honeycombio/honeycombio"
      version = "~> 0.7.0"
    }
  }
}

provider "honeycombio" {
  # You can set the API key with the environment variable HONEYCOMBIO_APIKEY
}

module "boards" {
  source          = "./boards"
  traces_dataset  = var.traces_dataset
  metrics_dataset = var.metrics_dataset
}

module "slos" {
  source          = "./slos"
  traces_dataset  = var.traces_dataset
  metrics_dataset = var.metrics_dataset
}
