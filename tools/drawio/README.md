# Draw.io - Diagramming Tool

## Description

Draw.io is a free online diagram software for making flowcharts, process diagrams, org charts, UML, ER diagrams, network diagrams and much more. This container provides a self-hosted version of the Draw.io application.

### Draw.io

- **Image**: `jgraph/drawio:latest`
- **Ports**:
  - 5080 (HTTP)
  - 5081 (HTTPS)

## Environment Variables

No specific environment variables are required for Draw.io in this basic configuration.

## Volumes

No persistent volumes are configured in this setup. Note that this means any diagrams need to be saved locally or to an external storage service.

## Exposed Ports

- **5080**: HTTP interface
- **5081**: HTTPS interface

## Health Check

- **Test**: Curl request to HTTP interface
- **Interval**: 1m30s
- **Timeout**: 10s
- **Retries**: 5
- **Start Period**: 10s

## Useful Links

- [Official Documentation](https://www.diagrams.net/doc/)
- [GitHub Repository](https://github.com/jgraph/drawio)
- [Docker Hub](https://hub.docker.com/r/jgraph/drawio)
