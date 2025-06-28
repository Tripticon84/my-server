# AdGuard Home - DNS Ad & Tracker Blocker

## Description

AdGuard Home is a network DNS server that protects your devices from ads, tracking, phishing, and malware. It works similarly to Pi-hole but offers additional features such as support for DNS-over-HTTPS and DNS-over-TLS for more secure browsing.

### AdGuard Home

- **Image**: `adguard/adguardhome:latest`
- **Ports**:
  - 53 (DNS)
  - 80 (DNS over HTTP)
  - 443 (DNS over HTTPS)
  - 3000 (web interface)
  - 853 (DNS over TLS)

## Environment Variables

No environment variables are required for the basic configuration of AdGuard Home.

## Volumes

- `/homelab/adguard-home/data:/opt/adguardhome/data`: Stores AdGuard Home data (filters, statistics, etc.)
- `/homelab/adguard-home/config:/opt/adguardhome/conf`: AdGuard Home configuration files

## Exposed Ports

- **53/tcp**: DNS service (TCP)
- **53/udp**: DNS service (UDP)
- **80/tcp**: DNS over HTTP (DoH) - TCP
- **80/udp**: DNS over HTTP (DoH) - UDP
- **443/tcp**: DNS over HTTPS (DoH) - TCP
- **443/udp**: DNS over HTTPS (DoH) - UDP
- **3000/tcp**: Administration web interface
- **853/tcp**: DNS over TLS (DoT) - TCP
- **853/udp**: DNS over TLS (DoT) - UDP

## Initial Setup

On first startup, access the web interface on port 3000 to configure AdGuard Home:

1. Set the administrator username and password
2. Configure DNS settings
3. Enable the desired blocklists

## Useful Links

- [Official Documentation](https://github.com/AdguardTeam/AdGuardHome/wiki)
- [GitHub Repository](https://github.com/AdguardTeam/AdGuardHome)
- [Docker Hub](https://hub.docker.com/r/adguard/adguardhome)
