# n8n - Workflow Automation

## Description

n8n is a free and open-source workflow automation tool. It allows you to connect anything to everything via its API. It's a fair-code licensed alternative to Zapier, IFTTT, and similar tools.

### n8n

- **Image**: `n8nio/n8n:latest`
- **Ports**:
  - 5678 (web interface)

## Environment Variables

- **PUID**: User ID for file permissions
- **PGID**: Group ID for file permissions
- **TZ**: Timezone (Europe/Paris)

## Volumes

- `/homelab/n8n/data:/home/node/.n8n`: n8n data and workflows

## Exposed Ports

- **5678**: Web interface

## First Startup

On first launch:

1. Access the web interface at the configured port
2. Create your first workflow
3. Configure credentials for the services you want to connect

## Useful Links

- [Official Documentation](https://docs.n8n.io/)
- [GitHub Repository](https://github.com/n8n-io/n8n)
- [Docker Hub](https://hub.docker.com/r/n8nio/n8n)
