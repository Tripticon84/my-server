# Excalidraw - Virtual Whiteboard

## Description

Excalidraw is a virtual whiteboard for sketching hand-drawn like diagrams. It's a collaborative drawing tool that emphasizes a hand-drawn style and ease of use. Excalidraw is perfect for creating quick diagrams, flowcharts, mockups, and more.

### Excalidraw

- **Image**: `excalidraw/excalidraw:latest`
- **Port**: 5000 (web interface)

## Environment Variables

No specific environment variables are required for Excalidraw in this basic configuration.

## Volumes

No persistent volumes are configured in this setup. Note that this means any drawings need to be saved locally or to an external storage service.

## Exposed Ports

- **5000**: Web interface (mapped to container port 80)

## Useful Links

- [Official Website](https://excalidraw.com/)
- [GitHub Repository](https://github.com/excalidraw/excalidraw)
- [Docker Hub](https://hub.docker.com/r/excalidraw/excalidraw)
