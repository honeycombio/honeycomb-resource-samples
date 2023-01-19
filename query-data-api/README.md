# Honeycomb Query Data API

A collection of scripts to grab query results programmatically. Consists of three API calls:

1. Create the Query (or Query Spec), which validates that the query parameters are valid. Note that creating a query does not run the query.
2. Run the query by creating a Query Result referencing the Query’s ID. This returns a Query Result ID. ]Currently requires an Enterprise license.
3. Poll the query result endpoint (with the Query Result ID) until the data is ready. Currently requires an Enterprise license

### Deploy with an API Key

You will need a Honeycomb API Key from your tenant via `https://ui.honeycomb.io/<TEAM_NAME>/environments/<ENVIRONMENT_NAME>/api_keys` AND access to the [Query Data API](https://docs.honeycomb.io/api/query-results/) to receive query data results.

#### For Python and Javascript:
Configure a `.env` file with your API Key to `HONEYCOMB_API_KEY` to run via:
```shell
node query_data_api.js
```
or
```shell
python3 query_data_api.py
```

#### For Go:
Run script with your API Key with a `-apiKey` flag
```shell
go run query_data_api.go -apiKey "HONEYCOMB_API_KEY"
```