<div align="center">
  <p>
    <h3>HiveMQ 4 MQTT Broker in GitHub Actions</h3>
  </p>
  <p>Start a HiveMQ 4 message broker in your GitHub Actions.</p>
</div>

---

## Introduction

This GitHub Action starts a HiveMQ 4 message broker as Docker container.
The published ports, TLS certificates and the HiveMQ configuration can be adjusted as needed.

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
        uses: namoshek/hivemq4-github-action@v1
        with:
          version: '4.4.4'
          ports: '1883:1883 8883:8883'
          certificates: ${{ github.workspace }}/.ci/tls-certificates
          config: ${{ github.workspace }}/.ci/hivemq-config.xml
          container-name: 'mqtt'
  
      - run: test
```

Currently, the following parameters are supported:

| Parameter | Default  | Description |
|-----------|----------|-------------|
| `version` | `latest` | An image tag of the [hivemq/hivemq4](`https://hub.docker.com/r/hivemq/hivemq4`) Docker image. |
| `ports`   | `1883:1883`   | Port mappings in a [host]:[container] format, delimited by spaces (example: "1883:1883 8883:8883") |
| `certificates` | -   | Absolute path to a directory containing certificate files which can be referenced in the config (the folder is mounted under `/hivemq-certs` in the container) |
| `config`  | -        | Absolute path to a custom `config.xml` configuration file to use |
| `container-name` | `hivemq` | The name of the spawned Docker container (can be used as hostname when accessed from other containers) |

All parameters are optional. If no `certificates` are given, no volume is mounted. If no `config` is given, the default HiveMQ config is used.

## License

This action is published under the [MIT license](LICENSE).
