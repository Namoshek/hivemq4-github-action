<div align="center">
  <p>
    <h3>HiveMQ 4 MQTT Broker in GitHub Actions</h3>
  </p>
  <p>Start a HiveMQ 4 message broker in your GitHub Actions.</p>
</div>

---

## Introduction

This GitHub Action starts a HiveMQ 4 message broker on the default port `1883` and `8000` for WebSockets.

This is useful when running tests against an MQTT broker.


## Usage

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Git checkout
        uses: actions/checkout@v2
  
      - name: Start HiveMQ
        uses: namoshek/hivemq4-github-action@v0.1.0
        with:
          version: '4.4.4'
  
      - run: test
```

Currently, the following parameters are supported:

| Parameter | Default  | Description |
|-----------|----------|-------------|
| `version` | `latest` | An image tag of the [hivemq/hivemq4](`https://hub.docker.com/r/hivemq/hivemq4`) Docker image. |
| `port`    | `1883`   | The default port for TCP connections (without SSL). |
| `port-websockets` | `8000` | The port for WebSocket connections (without SSL). |

## License

This action is published under the [MIT license](LICENSE).
