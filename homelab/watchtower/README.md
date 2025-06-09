# Watchtower - Automatic Docker Container Updates

## Description

Watchtower is a service that automates the updating of Docker containers. It monitors running containers and detects when their base image has changed. When Watchtower identifies that an image has been updated, it automatically pulls the new image and restarts the container using the updated image.

### Watchtower

- **Image**: `containrrr/watchtower:latest`
- **Schedule**: By default, runs daily at midnight (cron: "`0 0 * * *`")

## Environment Variables

- **WATCHTOWER_IMAGE_VERSION**: Version of Watchtower to use (default: `latest`)
- **WATCHTOWER_CLEANUP**: Remove old images after updating (default: `true`)
- **WATCHTOWER_ROLLING_RESTART**: Restart containers one at a time (default: `true`)
- **WATCHTOWER_SCHEDULE**: Cron schedule for updates (default: `0 0 * * *`)
- **WATCHTOWER_TIMEOUT**: Timeout for update operations (default: `60s`)
- **TZ**: Timezone for scheduling (default: `Europe/Paris`)

## Volumes

- `/var/run/docker.sock`: Docker socket mounted to allow Watchtower to communicate with the Docker daemon

## Exposed Ports

No ports are exposed by default as Watchtower runs as a background service.

## Useful Links

- [Official Documentation](https://containrrr.dev/watchtower/)
- [GitHub Repository](https://github.com/containrrr/watchtower)
