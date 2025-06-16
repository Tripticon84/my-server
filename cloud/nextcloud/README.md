# Nextcloud - Self-Hosted Cloud Platform

## Description

Nextcloud is a client-server software suite that allows you to create and use file storage and sharing services. It is a self-hosted alternative to services like Google Drive, Dropbox, or OneDrive, offering file synchronization, sharing, calendar, contacts, and much more.

### Services

- **Nextcloud**: Main web application
- **Database**: MariaDB database to store Nextcloud data

## Images

- **Nextcloud**: `nextcloud:latest`
- **Database**: `linuxserver/mariadb:latest`

## Environment Variables

### Database

- **PUID**: User ID for file permissions (1000)
- **PGID**: Group ID for file permissions (1000)
- **TZ**: Time zone (Europe/Paris)
- **MYSQL_DATABASE**: Name of the Nextcloud database
- **MYSQL_USER**: Database username
- **MYSQL_PASSWORD**: Database user password
- **MYSQL_ROOT_PASSWORD**: Database administrator password

### Nextcloud

- **TZ**: Time zone (Europe/Paris)

## Volumes

### Database Volumes

- `/homelab/nextcloud/database/data:/var/lib/mysql`: Database data storage

### Nextcloud Volumes

- `/homelab/nextcloud/conf:/config`: Nextcloud configuration
- `/homelab/nextcloud/data:/var/www/html`: Application files and user data storage

## Exposed Ports

- **8080**: Nextcloud web interface

## Useful Links

- [Official Documentation](https://docs.nextcloud.com/)
- [GitHub Repository](https://github.com/nextcloud/server)
- [Docker Hub - Nextcloud](https://hub.docker.com/_/nextcloud)
- [Docker Hub - MariaDB](https://hub.docker.com/r/linuxserver/mariadb)
