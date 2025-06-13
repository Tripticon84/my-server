# LibreSpeed - Self-Hosted Speed Test

## Description

LibreSpeed is a lightweight, privacy-friendly speed test tool that can be self-hosted. It provides a simple way to measure download and upload speeds, ping, and jitter without relying on external services. LibreSpeed doesn't require Flash, Java, or other browser plugins.

### LibreSpeed

- **Image**: `ghcr.io/librespeed/speedtest:latest`
- **Port**: 3334 (web interface)

## Environment Variables

- **MODE**: Operating mode (set to `standalone`)
- **DISTANCE**: Unit for distance measurement (set to `km`)

## Volumes

No persistent volumes are configured in this setup.

## Exposed Ports

- **3334**: Web interface (mapped to container port 8080)

## Useful Links

- [Official Website](https://librespeed.org/)
- [GitHub Repository](https://github.com/librespeed/speedtest)
- [Docker Documentation](https://github.com/librespeed/speedtest/wiki/Docker-container)
