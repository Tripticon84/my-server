# Vaultwarden - Self-Hosted Password Manager

## Description

Vaultwarden is an alternative implementation of the Bitwarden server written in Rust. It is a self-hosted password manager compatible with all Bitwarden clients (mobile apps, browser extensions, desktop clients). Vaultwarden allows you to store your passwords, secure notes, and other sensitive data on your own server.

### Vaultwarden

- **Image**: `vaultwarden/server:latest`
- **Port**: 5345 (web interface)

## Environment Variables

- **DOMAIN**: Full service URL (`https://vw.${DOMAIN}`)
- **SIGNUPS_ALLOWED**: Allow signups (`false`)
- **ADMIN_TOKEN**: Token to access the admin interface
- **WEBSOCKET_ENABLED**: Enable websockets for real-time notifications (`true`)
- **INVITATION_ALLOWED**: Allow invitations (`false`)

## Volumes

- `/homelab/vaultwarden/data:/data/`: Vaultwarden data storage (SQLite database, attachments, icons, etc.)

## Exposed Ports

- **5345**: Web interface (mapped to port 80 in the container)

## Configuration

Make sure to set a secure `ADMIN_TOKEN` in the `.env` file before deploying. This token allows you to access the Vaultwarden admin interface at `/admin`.

To generate a secure token, you can use the following command:

```bash
openssl rand -base64 48
```

## Useful Links

- [Official Documentation](https://github.com/dani-garcia/vaultwarden/wiki)
- [GitHub Repository](https://github.com/dani-garcia/vaultwarden)
- [Docker Hub](https://hub.docker.com/r/vaultwarden/server)
