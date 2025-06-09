# Portainer - Docker Management Interface

## Description

Portainer is a lightweight web interface for managing Docker environments. It allows you to easily view and manage Docker containers, images, volumes, and networks through an intuitive graphical interface.

### Portainer CE (Community Edition)

- **Image**: `portainer/portainer-ce:lts`
- **Port**: 9443 (web interface)

## Environment Variables

- **PORTAINER_EDITION** : Edition of Portainer to use (default: `ce`)
- **PORTAINER_IMAGE_VERSION** : Version of Portainer to use (default: `latest`)

## Volumes

- `/homelab/portainer/data`: Stores Portainer's configuration data
- `/var/run/docker.sock`: Docker socket mounted to allow Portainer to communicate with the Docker daemon

## Exposed Ports

- **9443**: Main Portainer web interface

## Useful Links

- [Official Documentation](https://docs.portainer.io/)
- [GitHub Repository](https://github.com/portainer/portainer)
