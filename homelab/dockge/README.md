# Dockge - Docker Compose Stack Manager

## Description

Dockge is a lightweight, user-friendly web UI for managing Docker Compose stacks. It provides an intuitive interface for deploying, monitoring, and managing Docker Compose applications. Dockge makes it easy to view logs, update configurations, and manage multiple Docker Compose projects.

### Dockge

- **Image**: `cmcooper1980/dockge:latest`
- **Port**: 5001 (web interface)

## Environment Variables

- **DOCKGE_STACKS_DIR**: Directory to store Docker Compose stacks (set to `/homelab/dockge/stacks`)
- **DOCKGE_ENABLE_CONSOLE**: Enable console access in the web UI (set to `true`)

## Volumes

- `/var/run/docker.sock`: Docker socket mounted to allow Dockge to communicate with the Docker daemon
- `/homelab/dockge/data`: Stores Dockge's configuration data
- `/homelab/dockge/stacks`: Stores Docker Compose stack files

## Exposed Ports

- **5001**: Web interface

## Useful Links

- [GitHub Repository](https://github.com/louislam/dockge)
- [Documentation](https://github.com/louislam/dockge/wiki)
