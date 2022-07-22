# Auto Instrumentation Operator Examples

This deploys a spring petclinic app that sends otel traces to an opentelemetry collector. The collector then sends traces to Honeycomb. The collector and auto instrumenation is setup via the opentelemetry operator.

## Install the operator

First install cert manager on your cluster. 

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.2/cert-manager.yaml
```

Next install the [Otel Operator](https://github.com/open-telemetry/opentelemetry-operator) on your cluster. 

```bash
kubectl apply -f https://github.com/open-telemetry/opentelemetry-operator/releases/latest/download/opentelemetry-operator.yaml
```

## Install the deployment

Go into the deploy folder. Modify the secret yaml with a base64 encoded Honeycomb API Key.  

Go into the collector yaml, change x-honeycomb-dataset value to desired dataset or remove it if on Honeycomb E&S.

Then deploy the app from within the deploy folder.  


```bash
kubectl apply -f .
```

## Install utility service

**ONLY DO THIS FOR TESTING**. The utility service should **not** be used in production.

Go into utility service folder. Deploy

```bash
kubectl apply -f .
```

## Test App

Shell into utility service pod.  Run curl command to test.

```bash
curl http://petclinic.petclinic:8080/owners
```


