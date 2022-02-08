# Honeycomb Boards

A collection of Honeycomb [Boards](https://docs.honeycomb.io/working-with-your-data/collaborating/boards/) that can be used to get started quickly with popular integrations.

Deploying Boards to your Honeycomb environment can be accomplished and automated with Terraform, or using a shell script.

### Deploy using Terraform

TODO: Add instructions here

### Deploy with a Shell script

Honeycomb's [Boards API](https://docs.honeycomb.io/api/boards-api/) can be used to create new Boards.
You will need your Honeycomb API Key, which you can get from Honeycomb Team Settings.
In the command below, replace `YOUR_API_KEY`, and `path/to/board.json` with your Honeycomb API Key, and the path to the Board you want to deploy.
```shell
curl https://api.honeycomb.io/1/boards \ 
    -X POST \
    -H "X-Honeycomb-Team: YOUR_API_KEY" \
    -d @path/to/board.json
```

## Available Boards

| Name       | Description                                                          | File                                 |
|------------|----------------------------------------------------------------------|--------------------------------------|
| Kubernetes | Works with the metrics collected from the Honeycomb Kubernetes Agent | [kubernetes.json](./kubernetes.json) |

