# Copyparty - File Server and Sharing Platform

## Description

Copyparty is a portable file server with an emphasis on speed and ease of use. It provides a web interface for uploading, downloading, and managing files with support for multiple users, drag-and-drop uploads, and real-time file transfers. Copyparty is designed to be lightweight and fast while offering advanced features like resumable uploads and directory browsing.

### Copyparty

- **Image**: `copyparty/iv`
- **Port**: 3923 (web interface)

## Environment Variables

- **LD_PRELOAD**: Memory allocator optimization (set to `/usr/lib/libmimalloc-secure.so.2`)
- **PYTHONUNBUFFERED**: Ensures Python output is sent straight to terminal without buffering

## Volumes

- `/homelab/copyparty:/cfg`: Configuration directory
- `/data/downloads:/w/srv/downloads`: Downloads directory
- `/data/media:/w/srv/media`: Media files directory
- `/homelab/:/w/srv/homelab`: Homelab directory
- `/data/music:/w/music`: Music directory
- `/data/cours:/w/cours`: Courses directory
- `/data/priv:/w/priv`: Private directory

## Exposed Ports

- **3923**: Web interface

## Networks

- **srv**: External network for service communication

## Useful Links

- [GitHub Repository](https://github.com/9001/copyparty)
- [Documentation](https://github.com/9001/copyparty/blob/hovudstraum/docs/README.md)
