# Refinery Docker Compose

This is a quick docker compose to spin up a single node refinery instance on docker for easy testing locally.

## Configuration

In refinery.toml, replace <yourAPIKey> with your api key to get refinery logs and metrics.  Change rules.toml to change rules. Anything eligible for live reload (rules.toml as an example), you can change in the files without restarting your local refinery instance. 

## Running

```bash
docker compose up
```

## Sending trace data to refinery

### OpenTelemetry
Point your exporter url to your local cluster with your api key as a header. Example nodeJS:

```js
const metadata = new Metadata();
metadata.set('x-honeycomb-team','<yourAPIKey>');
const traceExporter = new CollectorTraceExporter({
  url: 'grpc://localhost:9090/',
  metadata
});

```


