# qBittorrent - Torrent Client with Web Interface

## Description

qBittorrent is an advanced, cross-platform, and open-source BitTorrent client featuring a web user interface. It offers all the features you would expect from a quality BitTorrent client: integrated search, encryption support, priority management, and more.

### qBittorrent

- **Image**: `linuxserver/qbittorrent:latest`
- **Ports**:
  - 8073 (web interface)
  - 6881 (torrent traffic TCP/UDP)

## Environment Variables

- **PUID**: User ID for file permissions (`1000`)
- **PGID**: Group ID for file permissions (`1000`)
- **TZ**: Timezone (`Europe/Paris`)
- **WEBUI_PORT**: Web interface port (`8073`)
- **TORRENTING_PORT**: Torrent traffic port (`6881`)

## Volumes

- `/homelab/qbitorrent/conf:/config`: qBittorrent configuration storage
- `/homelab/qbitorrent/SEEDBOX/Downloads:/downloads`: Download folder

## Exposed Ports

- **8073**: Web interface
- **6881/tcp**: Torrent TCP traffic
- **6881/udp**: Torrent UDP traffic

## Default Settings

- **Default credentials**: admin / adminadmin
- It is recommended to change the password after the first login

## Useful Links

- [Official Documentation](https://github.com/qbittorrent/qBittorrent/wiki)
- [GitHub Repository](https://github.com/qbittorrent/qBittorrent)
