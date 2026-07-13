# Servarr Stack - Media Management Suite

## Description

The Servarr stack is a set of applications dedicated to automating the management of your digital media library. This suite of tools allows you to search, download, organize, and automatically manage your movies, TV series, and other media.

### Included Services

#### Radarr

- **Description**: Automated movie manager
- **Image**: `linuxserver/radarr:latest`
- **Port**: 7878

#### Sonarr

- **Description**: Automated TV series manager
- **Image**: `linuxserver/sonarr:latest`
- **Port**: 7979

#### Prowlarr

- **Description**: Indexer manager for Radarr and Sonarr
- **Image**: `linuxserver/prowlarr:latest`
- **Port**: 7980

#### FlareSolverr

- **Description**: Service to bypass Cloudflare protections
- **Image**: `ghcr.io/flaresolverr/flaresolverr:latest`
- **Port**: 7981

## Environment Variables

### Common Variables

- **PUID**: User ID for file permissions (1002)
- **PGID**: Group ID for file permissions (2001)
- **TZ**: Timezone (Europe/Paris)

### FlareSolverr

- **LOG_LEVEL**: Logging level (info)

## Volumes

### Radarr

- `/homelab/servarr/radarr/config:/config`: Configuration and database
- `/data/downloads:/downloads`: Shared downloads folder
- `/data/media/movies:/movies`: Movie library

### Sonarr

- `/homelab/servarr/sonarr/config:/config`: Configuration and database
- `/data/downloads:/downloads`: Shared downloads folder
- `/data/media/series:/series`: TV series library

### Prowlarr

- `/homelab/servarr/prowlarr:/config`: Configuration and database

## Exposed Ports

- **7878**: Radarr web interface
- **7979**: Sonarr web interface
- **7980**: Prowlarr web interface
- **7981**: FlareSolverr API

## Configuration Guide

1. **Prowlarr**: Start by configuring Prowlarr to add your indexers
2. **Radarr & Sonarr**: Set up your download clients
3. **Connect Prowlarr to Radarr & Sonarr**: In Prowlarr, add Radarr and Sonarr as applications
4. **FlareSolverr**: In Prowlarr, configure FlareSolverr for indexers protected by Cloudflare

## Useful Links

- [Radarr Documentation](https://wiki.servarr.com/radarr)
- [Sonarr Documentation](https://wiki.servarr.com/sonarr)
- [Prowlarr Documentation](https://wiki.servarr.com/prowlarr)
-
