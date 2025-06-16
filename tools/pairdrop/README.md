# PairDrop - Local and Secure File Sharing

## Description

PairDrop is an open-source alternative to AirDrop that works in your browser. It allows you to share files between devices directly, without requiring an account or installation. File transfers are end-to-end encrypted and stay on your local network for optimal security and speed.

### PairDrop

- **Image**: `linuxserver/pairdrop:latest`
- **Port**: 3000 (web interface)

## Environment Variables

- **PUID**: User ID for file permissions (`1000`)
- **PGID**: Group ID for file permissions (`1000`)
- **TZ**: Timezone (`Europe/Paris`)
- **RATE_LIMIT**: Transfer rate limit
- **WS_FALLBACK**: Use WebSocket fallback if WebRTC is not available (`false`)

## Volumes

No persistent volume is configured for PairDrop as it does not store any data on the server.

## Exposed Ports

- **3000**: Web interface

## Usage

1. Open PairDrop in your browser
2. Devices on the same network will appear automatically
3. Drag and drop files onto a device icon to start the transfer
4. The recipient must accept the transfer

## Useful Links

- [Official Website](https://pairdrop.net/)
- [GitHub Repository](https://github.com/schlagmichdoch/PairDrop)
