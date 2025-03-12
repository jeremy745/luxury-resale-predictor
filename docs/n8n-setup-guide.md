# Guide de Configuration n8n pour Luxury Resale Predictor

Ce document explique comment configurer et utiliser n8n pour le projet de prédiction de prix d'articles de maroquinerie de luxe.

## Sommaire

1. [Installation](#installation)
2. [Configuration initiale](#configuration-initiale)
3. [Credentials et connexions](#credentials-et-connexions)
4. [Workflows principaux](#workflows-principaux)
5. [Maintenance et dépannage](#maintenance-et-dépannage)

## Installation

### Prérequis

- Docker et Docker Compose installés
- 2 Go de RAM minimum recommandés
- Ports 5678 (n8n) et 5432 (PostgreSQL) disponibles

### Installation automatisée

Utilisez le script d'installation fourni :

```bash
# Cloner le dépôt si ce n'est pas déjà fait
git clone https://github.com/jeremy745/luxury-resale-predictor.git
cd luxury-resale-predictor

# Rendre le script exécutable
chmod +x setup-n8n.sh

# Exécuter le script
./setup-n8n.sh
```

### Installation manuelle

Si vous préférez une installation manuelle :

1. Copiez `.env.example` vers `.env` et modifiez les valeurs
2. Créez les dossiers `data/postgres` et `data/n8n`
3. Lancez les services avec `docker-compose up -d`

## Configuration initiale

Après l'installation, accédez à n8n via `http://localhost:5678`.

### Premier démarrage

1. Créez un compte administrateur
2. Modifiez les paramètres de sécurité dans Settings > Security
3. Configurez le fuseau horaire dans Settings > User

### Configuration système

Ajustez ces paramètres dans Settings > Advanced :

- **Execution timeout** : Réglez à 300 secondes pour les longues opérations de scraping
- **Max execution time** : Réglez à 3600 secondes pour les workflows complexes
- **Timezone** : Europe/Paris (ou votre fuseau horaire)

## Credentials et connexions

### Base de données PostgreSQL

1. Allez dans Settings > Credentials
2. Cliquez sur "Create New"
3. Sélectionnez "PostgreSQL"
4. Entrez les détails suivants :
   - **Host** : postgres
   - **Database** : n8n (ou comme défini dans .env)
   - **User** : n8n (ou comme défini dans .env)
   - **Password** : (mot de passe défini dans .env)
   - **Port** : 5432
   - **SSL** : Disabled

### Proxy (pour le scraping)

Si vous utilisez des proxies pour le scraping :

1. Allez dans Settings > Credentials
2. Cliquez sur "Create New"
3. Sélectionnez "HTTP Request" ou créez une credential personnalisée
4. Configurez vos informations de proxy

### Notifications par email

1. Allez dans Settings > Credentials
2. Cliquez sur "Create New"
3. Sélectionnez "SMTP"
4. Configurez avec les détails de votre serveur SMTP

## Workflows principaux

### Structure des workflows

Les workflows sont organisés selon leur fonction :

- **scraping/** : Collecte de données des plateformes
- **processing/** : Nettoyage et transformation des données
- **analysis/** : Prédiction de prix et analyse
- **reporting/** : Génération de rapports et notifications

### Scraping de Vestiaire Collective

Le workflow `vestiaire_daily_scraper.json` :
- S'exécute quotidiennement à 6h du matin
- Récupère les produits de marques de luxe définies
- Stocke les résultats dans la base de données
- Envoie des notifications en cas de succès ou d'échec

### Comment importer un workflow

1. Allez dans la section Workflows
2. Cliquez sur "Import from File"
3. Sélectionnez le fichier JSON du workflow
4. Vérifiez et ajustez les connexions aux credentials

### Comment activer un workflow

1. Ouvrez le workflow importé
2. Cliquez sur "Activate" en haut à droite
3. Assurez-vous que les triggers sont correctement configurés

## Maintenance et dépannage

### Surveillance des logs

Visualisez les logs avec :

```bash
docker-compose logs -f n8n
```

### Problèmes courants

**Erreur de connexion à la base de données :**
- Vérifiez que PostgreSQL est en cours d'exécution
- Vérifiez les credentials dans n8n

**Échecs de scraping :**
- Vérifiez les sélecteurs CSS dans les scripts de scraping
- Considérez l'utilisation de proxies si vous êtes bloqué

**Problèmes de performance :**
- Augmentez les ressources allouées à Docker
- Optimisez les workflows pour réduire la charge

### Sauvegarde

Sauvegardez régulièrement votre installation :

```bash
# Sauvegarde des données
docker-compose stop
tar -czf n8n-backup-$(date +%Y%m%d).tar.gz data/
docker-compose start
```

## Ressources additionnelles

- [Documentation officielle n8n](https://docs.n8n.io/)
- [Forum n8n](https://community.n8n.io/)
- [API n8n](https://docs.n8n.io/api/)
