# Jellyfin - Media System

## Description

Jellyfin is a free and open-source media management solution. It allows you to organize, manage, and stream your personal collection of movies, TV shows, music, and photos across all your devices. Unlike Plex or Emby, Jellyfin requires no subscription and fully respects your privacy.

### Jellyfin

- **Image**: `linuxserver/jellyfin:latest`
- **Ports**:
  - 8096 (web interface HTTP)
  - 8920 (web interface HTTPS)
  - 7359 (auto-discovery)
  - 1900 (DLNA)

## Environment Variables

- **PUID**: User ID for file permissions (2301)
- **PGID**: Group ID for file permissions (2001)
- **TZ**: Timezone (Europe/Paris)
- **DOCKER_MODS**: Additional Docker modules (linuxserver/mods:jellyfin-opencl-intel)

## Volumes

- `/homelab/jellyfin/config:/config`: Jellyfin configuration
- `/data/media/series:/data/series`: TV series library
- `/data/media/movies:/data/movies`: Movie library
- `/mnt/diskaladoree/video/:/data/diskaladoree`: Additional video library

## Exposed Ports

- **8096**: Web interface HTTP
- **8920**: Web interface HTTPS
- **7359/udp**: Auto-discovery on the local network
- **1900/udp**: DLNA service

## Hardware Acceleration

This setup is optimized to use Intel hardware acceleration (via `/dev/dri`) for video transcoding, which significantly improves performance during streaming playback.

## First Startup

On first launch, follow the setup wizard:

1. Create an administrator account
2. Configure your media libraries by pointing to the mounted paths
3. Set up transcoding options to take advantage of hardware acceleration

## Useful Links

- [Official Documentation](https://jellyfin.org/docs/)
- [GitHub Repository](https://github.com/jellyfin/jellyfin)
- [Docker Hub](https://hub.docker.com/r/linuxserver/jellyfin)
