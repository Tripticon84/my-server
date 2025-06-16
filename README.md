# My Homelab

This repository contains the configuration and setup for my personal homelab environment, which is primarily based on Docker containers.

## Containers

Here is the list of containers by category:

### Cloud

| Name        | Image                                                                     | Ports     | Description                   |
| ----------- | ------------------------------------------------------------------------- | --------- | ----------------------------- |
| immich      | [ghcr.io/immich-app/immich-server](https://github.com/immich-app/immich)  | 2283      | Smart photo management        |
| mealie      | [ghcr.io/mealie-recipes/mealie](https://github.com/mealie-recipes/mealie) | 9925:9000 | Recipe manager                |
| nextcloud   | [nextcloud](https://hub.docker.com/_/nextcloud)                           | 8080:80   | Personal cloud                |
| vaultwarden | [vaultwarden/server](https://hub.docker.com/r/vaultwarden/server)         | 5345:80   | Password manager              |

### Tools

| Name         | Image                                                                               | Ports                | Description                     |
| ------------ | ----------------------------------------------------------------------------------- | -------------------- | ------------------------------- |
| code-server  | [linuxserver/code-server](https://docs.linuxserver.io/images/docker-code-server/)   | 8443:8443            | VS Code in the browser          |
| convertx     | [ghcr.io/c4illin/convertx](https://github.com/c4illin/convertx)                     | 4003:3000            | File conversion                 |
| drawio       | [jgraph/drawio](https://hub.docker.com/r/jgraph/drawio)                             | 5080:8080, 5081:8443 | Online diagram tool             |
| excalidraw   | [excalidraw/excalidraw](https://hub.docker.com/r/excalidraw/excalidraw)             | 5200:80              | Collaborative drawing tool      |
| it-tools     | [sharevb/it-tools](https://hub.docker.com/r/sharevb/it-tools)                       | 4005:8080            | All-in-one IT toolbox           |
| kutt         | [kutt/kutt](https://hub.docker.com/r/kutt/kutt)                                     | 6740:3000            | URL shortener                   |
| librespeed   | [ghcr.io/librespeed/speedtest](https://github.com/librespeed/speedtest)             | 3334:8080            | Network speed test              |
| pairdrop     | [linuxserver/pairdrop](https://docs.linuxserver.io/images/docker-pairdrop/)         | 3200:3000            | Local file sharing              |
| stirling-pdf | [stirlingtools/stirling-pdf](https://hub.docker.com/r/stirlingtools/stirling-pdf)   | 4009:8080            | Advanced PDF tools              |
| your_spotify | [linuxserver/your_spotify](https://docs.linuxserver.io/images/docker-your_spotify/) | 3240:80, 3241:443    | Self-hosted Spotify interface   |

### Homelab

| Name        | Image                                                                     | Ports | Description                   |
| ----------- | ------------------------------------------------------------------------- | ----- | ----------------------------- |
| diun        | [crazymax/diun](https://hub.docker.com/r/crazymax/diun)                   | -     | Update notifier               |
| dockge      | [louislam/dockge](https://hub.docker.com/r/louislam/dockge)               | 5001  | Docker stack manager          |
| portainer   | [portainer/portainer-ce](https://hub.docker.com/r/portainer/portainer-ce) | 9443  | Container manager             |
| uptime-kuma | [louislam/uptime-kuma](https://hub.docker.com/r/louislam/uptime-kuma)     | 3001  | Service monitoring            |
| watchtower  | [containrrr/watchtower](https://hub.docker.com/r/containrrr/watchtower)   | -     | Automatic updates             |

### Downloaders

| Name        | Image                                                                             | Ports                        | Description       |
| ----------- | --------------------------------------------------------------------------------- | ---------------------------- | ----------------- |
| qbittorent  | [linuxserver/qbittorrent](https://docs.linuxserver.io/images/docker-qbittorrent/) | 8073:8073, 6881:6881/tcp+udp | BitTorrent client |

### Media

| Name      | Image                                                                         | Ports                | Description                |
| --------- | ----------------------------------------------------------------------------- | -------------------- | -------------------------- |
| jellyfin  | [linuxserver/jellyfin](https://docs.linuxserver.io/images/docker-jellyfin/)   | 8096, 8920, 7359/udp | Media server               |
| overseerr | [linuxserver/overseerr](https://docs.linuxserver.io/images/docker-overseerr/) | 5055                 | Media request management   |
| plex      | [linuxserver/plex](https://docs.linuxserver.io/images/docker-plex/)           | host network         | Media server               |

### Network

| Name         | Image                                                                       | Ports                         | Description                |
| ------------ | --------------------------------------------------------------------------- | ----------------------------- | -------------------------- |
| adguard-home | [adguard/adguardhome](https://hub.docker.com/r/adguard/adguardhome)         | 53/tcp+udp, 3000, 853/tcp+udp | DNS and ad blocking        |
| fail2ban     | [linuxserver/fail2ban](https://docs.linuxserver.io/images/docker-fail2ban/) | host network                  | Attack protection          |
| npmplus      | [zoeyvid/npmplus](https://hub.docker.com/r/zoeyvid/npmplus)                 | 80, 443, 81                   | Reverse proxy              |

---

## Volumes

Most containers use persistent volumes mounted from the `/homelab/[service_name]/...` directory.

## Configuration

Each service has its own docker-compose file and a .env file to configure environment variables.

## Documentation

See the README.md files in each subdirectory for more details on specific services.

## Networks

Here is the list of networks defined in `docker-compose.network.yml`:

| Network name | Subnet         | Description         |
| ------------ | -------------- | ------------------- |
| srv          | 172.20.0.0/24  | Main network        |
| monitoring   | 172.20.1.0/24  | Monitoring          |
| vpn          | 172.20.2.0/24  | VPN                 |
| cloud        | 172.20.3.0/24  | Cloud services      |
| media        | 172.20.4.0/24  | Media               |
| servarr      | 172.20.5.0/24  | Media management    |
| downloaders  | 172.20.6.0/24  | Downloaders         |
| tools        | 172.20.7.0/24  | Various tools       |
| servarr      | 172.20.5.0/24  | Media management    |
| downloaders  | 172.20.6.0/24  | Downloaders         |
| tools        | 172.20.7.0/24  | Various tools       |
