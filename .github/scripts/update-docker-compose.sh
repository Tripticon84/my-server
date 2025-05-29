#!/bin/bash

# Script pour mettre à jour automatiquement les includes dans docker-compose.yml

set -e

echo "🔍 Recherche des fichiers docker-compose dans les dossiers de services..."

# Fichier de sortie
DOCKER_COMPOSE_FILE="docker-compose.yml"
TEMP_FILE=$(mktemp)

# En-tête du fichier docker-compose.yml
cat > "$TEMP_FILE" << 'EOF'
include:
EOF

# Fonction pour trouver tous les fichiers docker-compose.*.yml
find_docker_compose_files() {
    # Chercher dans tous les dossiers sauf les dossiers cachés et node_modules
    find . -maxdepth 2 -name "docker-compose.*.yml" -not -path "./.git/*" -not -path "./.doc/*" | sort
}

# Compter les fichiers trouvés
file_count=0

# Parcourir tous les fichiers docker-compose trouvés
while IFS= read -r file; do
    if [[ -n "$file" ]]; then
        # Supprimer le ./ du début
        clean_file=${file#./}
        echo "  - \"$clean_file\"" >> "$TEMP_FILE"
        echo "✅ Ajouté: $clean_file"
        ((file_count++))
    fi
done < <(find_docker_compose_files)

echo ""
echo "📊 Résumé:"
echo "   - $file_count fichiers docker-compose trouvés"

# Vérifier si le fichier a changé
if [[ -f "$DOCKER_COMPOSE_FILE" ]]; then
    if diff -q "$TEMP_FILE" "$DOCKER_COMPOSE_FILE" > /dev/null 2>&1; then
        echo "   - Aucun changement détecté"
        rm "$TEMP_FILE"
        exit 0
    else
        echo "   - Changements détectés, mise à jour du fichier"
    fi
else
    echo "   - Création du fichier docker-compose.yml"
fi

# Remplacer le fichier original
mv "$TEMP_FILE" "$DOCKER_COMPOSE_FILE"

echo "✅ docker-compose.yml mis à jour avec succès!"

# Afficher le contenu final
echo ""
echo "📄 Contenu du fichier docker-compose.yml:"
echo "----------------------------------------"
cat "$DOCKER_COMPOSE_FILE"
echo "----------------------------------------"
