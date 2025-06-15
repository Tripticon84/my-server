# Diun - Docker Image Update Notifier

## Description

Diun (Docker Image Update Notifier) is a utility that allows you to receive notifications when a Docker image update is available. It monitors your Docker containers and registries, and alerts you when new versions are published.

### Diun

- **Image**: `crazymax/diun:latest`
- **Operation**: Background service (no web interface)

## Environment Variables

- **TZ**: Time zone (Europe/Paris)
- **LOG_LEVEL**: Logging level (info)
- **LOG_JSON**: JSON logging format (false)
- **DIUN_WATCH_WORKERS**: Number of workers for monitoring (10)
- **DIUN_WATCH_SCHEDULE**: Check schedule (`0 0 * * 5` - every Friday at midnight)
- **DIUN_WATCH_JITTER**: Random delay between checks (30s)
- **DIUN_PROVIDERS_DOCKER**: Enable Docker container monitoring (true)
- **DIUN_PROVIDERS_DOCKER_WATCHBYDEFAULT**: Monitor all containers by default (true)
- **DIUN_NOTIF_TELEGRAM_TOKEN**: Telegram token for notifications
- **DIUN_NOTIF_TELEGRAM_CHATIDS**: Telegram chat IDs for notifications

## Volumes

- `/homelab/diun/data:/data`: Storage for Diun data and configuration
- `/var/run/docker.sock:/var/run/docker.sock`: Docker socket for communication with the Docker daemon

## Notifications

Diun is configured to send notifications via Telegram when image updates are detected. The custom message template includes:

- Container name and ID
- Description
- Version
- Update status
- Image name with link to Docker Hub (if available)
- Image creation date
- Repository link

## Useful Links

- [Official Documentation](https://crazymax.dev/diun/)
- [GitHub Repository](https://github.com/crazy-max/diun)
