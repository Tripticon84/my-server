# Uptime Kuma - Availability Monitoring

## Description

Uptime Kuma is a modern and easy-to-use uptime monitoring tool. It allows you to track the availability of your websites, APIs, and other services in real time through an intuitive web interface. It offers features such as notifications, response time monitoring, and customizable dashboards.

### Uptime Kuma

- **Image**: `louislam/uptime-kuma:latest`
- **Port**: 3001 (web interface)

## Environment Variables

- **UPTIME_KUMA_VERSION**: Uptime Kuma version to use (default: `latest`)

## Volumes

- `/homelab/uptime-kuma/data:/app/data`: Stores Uptime Kuma's configuration and database data

## Exposed Ports

- **3001**: Main Uptime Kuma web interface

## Useful Links

- [Official Documentation](https://github.com/louislam/uptime-kuma/wiki)
- [GitHub Repository](https://github.com/louislam/uptime-kuma)
