#!/bin/bash

# Script d'installation et de configuration de n8n pour le projet Luxury Resale Predictor
# Auteur: jeremy745
# Date: 2025-03-13

set -e  # Arrêter le script en cas d'erreur

# Couleurs pour les messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages
log() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

# Vérifier si Docker est installé
log "Vérification de Docker..."
if ! command -v docker &> /dev/null; then
    error "Docker n'est pas installé. Veuillez installer Docker avant de continuer."
fi

# Vérifier si Docker Compose est installé
log "Vérification de Docker Compose..."
if ! command -v docker-compose &> /dev/null; then
    error "Docker Compose n'est pas installé. Veuillez installer Docker Compose avant de continuer."
fi

# Créer le fichier .env à partir de .env.example
if [ ! -f ".env" ]; then
    log "Création du fichier .env..."
    cp .env.example .env
    
    # Générer une clé d'encryption aléatoire
    ENC_KEY=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    sed -i "s/your-random-encryption-key-at-least-32-chars/$ENC_KEY/g" .env
    
    # Générer un mot de passe PostgreSQL aléatoire
    DB_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
    sed -i "s/your-secure-password/$DB_PASSWORD/g" .env
    
    log "Fichier .env créé avec des valeurs aléatoires."
    log "⚠️  N'oubliez pas de sauvegarder ce fichier dans un endroit sécurisé!"
else
    warn "Le fichier .env existe déjà. Il ne sera pas modifié."
fi

# Créer les répertoires nécessaires
log "Création des répertoires..."
mkdir -p data/postgres data/n8n

# Mettre à jour les permissions
log "Mise à jour des permissions..."
chmod +x setup-n8n.sh

# Démarrer les services
log "Démarrage des services n8n..."
docker-compose up -d

# Vérifier si les services sont en cours d'exécution
sleep 5
if docker-compose ps | grep -q "Up"; then
    log "Services n8n démarrés avec succès!"
    log "n8n est accessible à l'adresse: http://localhost:5678"
    log "Nom d'utilisateur par défaut: admin@example.com"
    log "Mot de passe par défaut: changeme"
    log "⚠️  Veuillez changer le mot de passe par défaut dès la première connexion!"
else
    error "Erreur lors du démarrage des services. Vérifiez les logs avec 'docker-compose logs'."
fi

# Instructions pour la suite
cat << EOF

${GREEN}=== Installation terminée ===${NC}

Pour gérer votre installation n8n:
- Démarrer: docker-compose up -d
- Arrêter: docker-compose down
- Voir les logs: docker-compose logs -f
- Redémarrer: docker-compose restart

${YELLOW}Prochaines étapes:${NC}
1. Connectez-vous à l'interface n8n: http://localhost:5678
2. Changez le mot de passe administrateur
3. Configurez les credentials pour la base de données et autres services
4. Importez les workflows depuis le répertoire workflows/

${GREEN}Bon développement!${NC}
EOF
