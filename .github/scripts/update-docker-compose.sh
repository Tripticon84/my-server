#!/bin/bash

# Script pour mettre à jour docker-compose.yml avec tous les fichiers docker-compose.xxx.yml des services
# Exclut docker-compose.network.yml

set -e

# Chemin du fichier docker-compose.yml
DOCKER_COMPOSE_FILE="docker-compose.yml"

# Début du nouveau contenu
NEW_CONTENT="include:"

# Créer une liste temporaire des fichiers à inclure
TEMP_FILE=$(mktemp)

# Rechercher tous les fichiers docker-compose.*.yml dans les sous-répertoires
find . -maxdepth 2 -name "docker-compose.*.yml" | sort > "$TEMP_FILE"

# Parcourir la liste des fichiers
while read file; do
    # Exclure docker-compose.network.yml
    if [[ "$file" != "./docker-compose.network.yml" ]]; then
        # Extraire le chemin relatif
        relative_path=${file:2}  # Supprimer le './' au début

        # Ajouter au contenu
        NEW_CONTENT="$NEW_CONTENT\n  - \"$relative_path\""
    fi
done < "$TEMP_FILE"

# Supprimer le fichier temporaire
rm "$TEMP_FILE"

# Écrire le nouveau contenu dans le fichier
echo -e "$NEW_CONTENT" > "$DOCKER_COMPOSE_FILE"
echo "Le fichier $DOCKER_COMPOSE_FILE a été mis à jour avec succès."
