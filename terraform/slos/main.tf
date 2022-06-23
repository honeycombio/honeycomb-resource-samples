# Terraform configuration

terraform {
  required_providers {
    honeycombio = {
      source  = "honeycombio/honeycombio"
      version = ">= 0.7.0"
    }
  }
}

provider "honeycombio" {
  # You can set the API key with the environment variable HONEYCOMBIO_APIKEY
}

module "derived_columns" {
  source          = "../derived_columns"
  traces_dataset  = var.traces_dataset
  metrics_dataset = var.metrics_dataset
}
