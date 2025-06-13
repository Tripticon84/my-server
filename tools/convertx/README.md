# ConvertX - Media Conversion Tool

## Description

ConvertX is a user-friendly web application for converting media files between different formats. It provides a simple interface for uploading, converting, and downloading various types of media files including video, audio, and images. ConvertX is built with privacy in mind, processing files locally on your server.

### ConvertX

- **Image**: `ghcr.io/c4illin/convertx:latest`
- **Port**: 4003 (web interface)

## Environment Variables

- **JWT_SECRET**: Secret key for JWT authentication
- **LANGUAGE**: Interface language (set to `fr` for French)

## Volumes

- `/homelab/convertx/data`: Stores uploaded and converted files

## Exposed Ports

- **4003**: Web interface (mapped to container port 3000)

## Useful Links

- [GitHub Repository](https://github.com/c4illin/convertx)
- [Container Registry](https://github.com/c4illin/convertx/pkgs/container/convertx)
