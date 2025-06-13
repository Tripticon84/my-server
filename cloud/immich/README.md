# Immich - Self-Hosted Photo and Video Backup Solution

## Description

Immich is a high-performance, self-hosted photo and video backup solution. It provides automatic mobile uploads, powerful search, sharing, and machine learning features for organizing your media. Immich is designed for privacy and speed, running entirely on your own infrastructure.

### Main Services

- **immich-server**: Main API and web interface
- **immich-machine-learning**: Machine learning service for facial recognition, object detection, etc.
- **redis**: In-memory database used for caching and queues
- **database**: PostgreSQL database with vector and pgvectors extensions

## Images

- `ghcr.io/immich-app/immich-server:${IMMICH_VERSION:-release}`
- `ghcr.io/immich-app/immich-machine-learning:${IMMICH_VERSION:-release}-openvino`
- `docker.io/valkey/valkey:8-bookworm`
- `ghcr.io/immich-app/postgres:14-vectorchord0.3.0-pgvectors0.2.0`

## Environment Variables

- **IMMICH_VERSION**: Version of Immich to use (default: `release`)
- **UPLOAD_LOCATION**: Path for storing uploaded media (e.g., `/homelab/immich/upload`)
- **DB_PASSWORD**: Database password
- **DB_USERNAME**: Database user
- **DB_DATABASE_NAME**: Database name
- **DB_DATA_LOCATION**: Path for database storage

## Volumes

- `${UPLOAD_LOCATION}:/usr/src/app/upload`: Media storage
- `model-cache:/cache`: ML model cache
- `${DB_DATA_LOCATION}:/var/lib/postgresql/data`: Database storage

## Exposed Ports

- **2283**: Immich web interface and API

## Hardware Acceleration

- Transcoding and machine learning services can be hardware accelerated (see `hwaccel.transcoding.yml` and `hwaccel.ml.yml`).
- Adjust the `service` and image tags for your hardware (e.g., `cuda`, `openvino`, `quicksync`, etc.).

## Useful Links

- [Official Documentation](https://immich.app/docs/)
- [GitHub Repository](https://github.com/immich-app/immich)
- [Docker Hub](https://hub.docker.com/r/immichapp/immich-server)
