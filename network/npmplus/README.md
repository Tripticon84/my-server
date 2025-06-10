# NPM Plus - Nginx Proxy Manager Plus

## Description

NPM Plus (Nginx Proxy Manager Plus) is an enhanced version of Nginx Proxy Manager that provides a simple and intuitive web interface to configure and manage Nginx as a reverse proxy. It allows you to easily create SSL-secured hosts with Let's Encrypt integration, manage redirections, and configure proxy hosts without the need to understand Nginx configuration files.

### NPM Plus

- **Image**: `zoeyvid/npmplus:latest`
- **Ports**:
  - 80 (HTTP)
  - 443 (HTTPS)
  - 81 (Admin web interface)

## Environment Variables

- **NPMPLUS_IMAGE_VERSION**: Version of NPM Plus to use (default: `latest`)
- **TIMEZONE**: Timezone for the container (e.g., `Europe/Paris`)

## Volumes

- `/homelab/npmplus/data`: Stores NPM Plus configuration and database
- `/homelab/npmplus/letsencrypt`: Stores Let's Encrypt certificates

## Exposed Ports

- **20080**: HTTP port
- **20443**: HTTPS port
- **81**: NPM Plus admin web interface

## Useful Links

- [GitHub Repository](https://github.com/ZoeyVid/NPM-Plus)
- [Docker Hub](https://hub.docker.com/r/zoeyvid/npmplus)
