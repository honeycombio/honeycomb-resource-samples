# Honeycomb Derived Columns

A collection of Honeycomb [Derived Columns](https://docs.honeycomb.io/working-with-your-data/customizing-your-query/derived-columns/) that can be used to get started with popular Honeycomb use cases.

Deploying Derived Columns to your Honeycomb environment can be accomplished and automated with Terraform, or using a shell script.

### Deploy using Terraform

TODO: Add instructions here

### Deploy with a Shell script

Honeycomb's [Derived Columns API](https://docs.honeycomb.io/api/derived-columns/) can be used to create new Derived Columns.
You will need your Honeycomb API Key, which you can get from Honeycomb Team Settings.
In the command below:
- replace `$DATASET` with the Honeycomb Dataset to add the Derived Column to
- replace `YOUR_API_KEY` with your Honeycomb API Key
- replace `path/to/dc.json` with the path to the Derived Column you want to deploy
```shell
curl https://api.honeycomb.io/1/derived_columns/$DATASET \ 
    -X POST \
    -H "X-Honeycomb-Team: YOUR_API_KEY" \
    -d @path/to/dc.json
```

## Available Derived Columns

| Name | Description | File |
|------|-------------|------|
|      |             |      |

