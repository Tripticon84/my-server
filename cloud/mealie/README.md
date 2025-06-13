# Mealie - Self-Hosted Recipe Manager

## Description

Mealie is an open-source, self-hosted recipe manager and meal planner. It allows you to store, organize, and plan your recipes with a beautiful web interface. Mealie supports importing recipes from various sources, meal planning, shopping lists, and more.

### Mealie

- **Image**: `ghcr.io/mealie-recipes/mealie:latest`
- **Port**: 9925 (web interface)

## Environment Variables

- **ALLOW_SIGNUP**: Allow new user signups (`false` to disable public registration)
- **PUID**: User ID for file permissions (default: `1000`)
- **PGID**: Group ID for file permissions (default: `1000`)
- **TZ**: Timezone (default: `Europe/Paris`)
- **BASE_URL**: Public URL for the Mealie instance

## Volumes

- `/homelab/mealie/data:/app/data/`: Stores Mealie's database and configuration

## Exposed Ports

- **9925**: Web interface (mapped to container port 9000)

## Useful Links

- [Official Documentation](https://docs.mealie.io/)
- [GitHub Repository](https://github.com/mealie-recipes/mealie)
- [Docker Hub](https://hub.docker.com/r/hkotel/mealie)
