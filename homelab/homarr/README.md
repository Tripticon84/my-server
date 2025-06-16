# Homarr - Dashboard and Service Organizer

## Description

Homarr is a sleek and modern dashboard that helps you organize and access all your self-hosted services from a single place. It features drag-and-drop widgets, service status monitoring, and easy configuration, making it ideal for managing your homelab or server environment.

### Homarr

- **Image**: `ghcr.io/homarr-labs/homarr:latest`
- **Port**: 7575 (web interface)

## Environment Variables

- **HOMARR_SECRET_ENCRYPTION_KEY**: Secret key for encrypting sensitive data in Homarr

## Volumes

- `/var/run/docker.sock`: Docker socket for service status and integration
- `./homarr/appdata:/appdata`: Stores Homarr's configuration and data

## Exposed Ports

- **7575**: Web interface

## Useful Links

- [GitHub Repository](https://github.com/ajnart/homarr)
- [Documentation](https://homarr.dev/docs/)
- [Docker Hub](https://hub.docker.com/r/homarr/homarr)
