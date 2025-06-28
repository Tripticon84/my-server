# Pingvin Share - Self-Hosted File Sharing Service

## Description

Pingvin Share is a simple, lightweight, and self-hosted file sharing service that allows you to easily share files with others. It provides temporary links for file downloads, expiration dates, and password protection in a clean, user-friendly interface.

### Pingvin Share

- **Image**: `stonith404/pingvin-share:latest`
- **Port**: 6548 (web interface)

## Environment Variables

- **TRUST_PROXY**: Enable trust proxy setting for use behind reverse proxies (set to `true`)

## Volumes

- `/homelab/pingvin-share:/opt/app/backend/data`: Main data storage for uploaded files
- `/homelab/pingvin-share/data/images:/opt/app/frontend/public/img`: Storage for image files
- `/homelab/pingvin-share/config/config.yaml:/opt/app/config.yaml`: Configuration file

## Exposed Ports

- **6548**: Web interface (mapped to container port 3000)

## Configuration

Pingvin Share can be configured by editing the `config.yaml` file. Key configuration options include:

- File size limits
- Storage quotas
- Authentication settings
- Email notifications
- Link expiration settings

## Useful Links

- [GitHub Repository](https://github.com/stonith404/pingvin-share)
- [Docker Hub](https://hub.docker.com/r/stonith404/pingvin-share)
