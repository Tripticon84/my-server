# Stirling PDF - PDF Manipulation Tool

## Description

Stirling PDF is a powerful, locally hosted web application that allows you to perform various operations on PDF files. It provides functionality for splitting, merging, converting, rotating, compressing, and more, all while keeping your documents private by processing them locally.

### Stirling PDF

- **Image**: `stirlingtools/stirling-pdf:latest`
- **Port**: 4009 (web interface)

## Environment Variables

- **DOCKER_ENABLE_SECURITY**: Security features toggle (set to `false`)
- **LANGS**: Supported languages (set to `fr_FR`)

## Volumes

- `/homelab/stirling-pdf/training-data`: OCR training data for text recognition
- `/homelab/stirling-pdf/conf`: Configuration files
- `/homelab/stirling-pdf/custom-files`: Custom files directory
- `/homelab/stirling-pdf/logs`: Log files
- `/homelab/stirling-pdf/pipeline`: Pipeline processing directory

## Exposed Ports

- **4009**: Web interface (mapped to container port 8080)

## Useful Links

- [GitHub Repository](https://github.com/Stirling-Tools/Stirling-PDF)
- [Docker Hub](https://hub.docker.com/r/stirlingtools/stirling-pdf)
