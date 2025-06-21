#!/bin/bash

# Création du groupe homelab s'il n'existe pas
if ! getent group homelab >/dev/null; then
    groupadd -g 2001 homelab
fi

# Définition des utilisateurs et UID
declare -A users=(
    # Cloud
    [immich]=2001
    [mealie]=2002
    [nextcloud]=2003
    [pelican]=2004
    [vaultwarden]=2005

    # Downloaders
    [qbittorrent]=2106

    # Homelab
    [diun]=2207
    [dockge]=2208
    [homarr]=2209
    [portainer]=2210
    [uptime-kuma]=2211

    # Media
    [mediaserver]=2301

    # Network
    [adguardhome]=2401
    [npmplus]=2402

    # Tools
    [code-server]=2501
    [convertx]=2502
    [drawio]=2503
    [excalidraw]=2504
    [it-tools]=2505
    [kutt]=2506
    [librespeed]=2507
    [stirling-pdf]=2508
    [your-spotify]=2509
)

# Création des utilisateurs
for user in "${!users[@]}"; do
    uid="${users[$user]}"
    if ! id "$user" &>/dev/null; then
        useradd -M -g homelab -G docker -u "$uid" "$user"
    fi
done
