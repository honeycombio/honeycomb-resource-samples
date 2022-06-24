### Prerequisites
You must have `terraform` installed. Follow [these directions](https://learn.hashicorp.com/tutorials/terraform/install-cli) to install for your platform.

You will need a Honeycomb API key with the adequate permissions to create boards, queries etc.. Once you have the API key, you can set it like so:

```
export HONEYCOMBIO_APIKEY=<YOUR_API_KEY>
```

Or define it via the `api_key` variable.

### Quickstart
Create a `<your-filename>.tfvars` file with the following variables:

```
metrics_dataset = "<YOUR-METRICS-DATASET>"
traces_dataset  = "<YOUR-TRACES-DATASET>"
```

Then, to run terraform plan or apply for all modules in this directory (`terraform`), run:

```
terraform init
terraform plan --var-file="<your-filename>.tfvars" -out tfplan.out
terraform apply --var-file="<your-filename>.tfvars"
```


To evaluate only a specific module - like `boards` or `queries`:

```
cd <YOUR-DESIRED-DIRECTORY>
terraform init
terraform plan --var-file="<your-filename>.tfvars" -out tfplan.out
terraform apply --var-file="<your-filename>.tfvars"
```
