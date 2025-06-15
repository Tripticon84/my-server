# Code-Server - VS Code in the Browser

## Description

Code-Server is a tool that allows you to run VS Code on any machine and access it through a browser. It provides the full VS Code experience, including extensions, terminal access, and file management, all accessible via a web interface.

### Code-Server

- **Image**: `linuxserver/code-server:latest`
- **Port**: 8443 (web interface)

## Environment Variables

- **TZ**: Timezone setting (uses the global TIMEZONE variable)
- **PASSWORD**: Password for accessing the web interface (set to `alpine`)
- **SUDO_PASSWORD**: Password for sudo operations within the container (set to `alpine`)
- **PROXY_DOMAIN**: Domain for proxy configuration (set to `dev.${DOMAIN}`)

## Volumes

- `/homelab/code-server/conf:/config`: Stores Code-Server configuration, installed extensions, and user data

## Exposed Ports

- **8443**: Web interface

## Useful Links

- [Official Website](https://github.com/coder/code-server)
- [LinuxServer.io Documentation](https://docs.linuxserver.io/images/docker-code-server)
- [Docker Hub](https://hub.docker.com/r/linuxserver/code-server)
