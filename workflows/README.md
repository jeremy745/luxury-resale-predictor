# Workflows n8n

Ce répertoire contient les workflows n8n exportés pour le projet de prédiction de prix d'articles de maroquinerie de luxe.

## Structure

- `scraping/` - Workflows pour le scraping de données
- `processing/` - Workflows pour le traitement et la normalisation des données
- `analysis/` - Workflows pour l'analyse et la prédiction des prix
- `reporting/` - Workflows pour la génération de rapports et notifications

## Installation

Les workflows peuvent être importés directement dans n8n via l'interface utilisateur.

1. Ouvrez l'interface n8n (par défaut sur http://localhost:5678)
2. Cliquez sur "Workflows" dans le menu de gauche
3. Cliquez sur "Import from File"
4. Sélectionnez le fichier .json du workflow à importer

## Configuration

Avant d'exécuter les workflows, vous devez configurer les credentials pour les services externes :

1. Dans n8n, allez dans "Settings" > "Credentials"
2. Ajoutez les credentials nécessaires pour :
   - Base de données PostgreSQL
   - APIs externes (si applicable)
   - Services de proxy (si nécessaire pour le scraping)

## Nomenclature

Les workflows suivent cette convention de nommage :
- `[catégorie]_[fonction]_[version].json`

Exemple : `scraping_vestiaire_daily_v1.json`
