#!/bin/bash

# Script pour vérifier que toutes les variables d'environnement des services
# sont présentes dans .env.default
# Auteur: GitHub Action
# Date: $(date)

set -e

echo "🔍 Vérification des variables d'environnement..."

ENV_DEFAULT_FILE=".env.default"
TEMP_VARS_FILE=$(mktemp)
MISSING_VARS_FILE=$(mktemp)
EXIT_CODE=0

# Vérifier que .env.default existe
if [[ ! -f "$ENV_DEFAULT_FILE" ]]; then
    echo "❌ Erreur: Le fichier $ENV_DEFAULT_FILE n'existe pas!"
    exit 1
fi

echo "📄 Lecture du fichier $ENV_DEFAULT_FILE..."

# Extraire les variables existantes de .env.default (ignorer les commentaires et lignes vides)
grep -E '^[A-Z_][A-Z0-9_]*=' "$ENV_DEFAULT_FILE" | cut -d'=' -f1 | sort > "$TEMP_VARS_FILE"

echo "✅ $(wc -l < "$TEMP_VARS_FILE") variables trouvées dans $ENV_DEFAULT_FILE"
echo ""

# Fonction pour extraire les variables d'un fichier docker-compose
extract_env_vars_from_compose() {
    local file="$1"
    local service_name="$2"

    echo "🔍 Analyse du service: $service_name (fichier: $file)"

    # Extraire les variables ${VAR} et ${VAR:-default} du fichier
    # Cette regex capture les variables d'environnement utilisées dans le docker-compose
    grep -oE '\$\{[A-Z_][A-Z0-9_]*[^}]*\}' "$file" 2>/dev/null | \
    sed 's/\${//g' | \
    sed 's/:.*}//g' | \
    sed 's/}//g' | \
    sort -u | \
    while read -r var; do
        if [[ -n "$var" ]]; then
            echo "  📋 Variable trouvée: $var"

            # Vérifier si la variable existe dans .env.default
            if ! grep -q "^${var}=" "$TEMP_VARS_FILE"; then
                echo "  ❌ Variable manquante: $var"
                echo "$service_name:$var" >> "$MISSING_VARS_FILE"
                return 1
            else
                echo "  ✅ Variable OK: $var"
            fi
        fi
    done

    local result=$?
    echo ""
    return $result
}

# Fonction pour analyser tous les services
check_all_services() {
    local total_services=0
    local failed_services=0

    # Rechercher tous les fichiers docker-compose.*.yml
    while IFS= read -r file; do
        if [[ -n "$file" && -f "$file" ]]; then
            # Extraire le nom du service du chemin du fichier
            service_name=$(dirname "$file")
            if [[ "$service_name" == "." ]]; then
                service_name=$(basename "$file" | sed 's/docker-compose\.//g' | sed 's/\.yml//g')
            fi

            ((total_services++))

            if ! extract_env_vars_from_compose "$file" "$service_name"; then
                ((failed_services++))
                EXIT_CODE=1
            fi
        fi
    done < <(find . -maxdepth 2 -name "docker-compose.*.yml" -not -path "./.git/*")

    echo "📊 Résumé de la vérification:"
    echo "   - Services analysés: $total_services"
    echo "   - Services avec des variables manquantes: $failed_services"
    echo ""
}

# Lancer la vérification
check_all_services

# Afficher les variables manquantes si il y en a
if [[ -s "$MISSING_VARS_FILE" ]]; then
    echo "❌ Variables d'environnement manquantes dans $ENV_DEFAULT_FILE:"
    echo "================================================================"

    # Grouper par service
    current_service=""
    while IFS=':' read -r service var; do
        if [[ "$service" != "$current_service" ]]; then
            echo ""
            echo "🔧 Service: $service"
            current_service="$service"
        fi
        echo "   - $var="
    done < "$MISSING_VARS_FILE"

    echo ""
    echo "💡 Suggestion: Ajoutez ces variables à votre fichier $ENV_DEFAULT_FILE"
    echo ""
else
    echo "✅ Toutes les variables d'environnement sont présentes dans $ENV_DEFAULT_FILE!"
fi

# Nettoyer les fichiers temporaires
rm -f "$TEMP_VARS_FILE" "$MISSING_VARS_FILE"

# Afficher le statut final
if [[ $EXIT_CODE -eq 0 ]]; then
    echo "🎉 Vérification terminée avec succès!"
else
    echo "💥 Vérification échouée - Variables manquantes détectées!"
fi

exit $EXIT_CODE
