# Luxury Resale Predictor

Système de prédiction de prix de revente pour articles de maroquinerie de luxe utilisant des agents IA et des workflows n8n.

## 🌟 Vue d'ensemble

Ce projet vise à déterminer le prix optimal de revente pour les articles de maroquinerie de luxe en analysant les données du marché secondaire, principalement de Vestiaire Collective. Le système utilise une architecture basée sur des agents IA et des workflows automatisés pour collecter, analyser et prédire les prix.

## 🏗️ Architecture du projet

Le projet est divisé en trois dépôts GitHub principaux :

1. [**luxury-resale-predictor**](https://github.com/jeremy745/luxury-resale-predictor) (ce dépôt) : Orchestration et documentation principale
2. [**luxury-scrapers**](https://github.com/jeremy745/luxury-scrapers) : Scraping et collecte de données
3. [**luxury-ai-models**](https://github.com/jeremy745/luxury-ai-models) : Modèles d'IA et agents

## 🧩 Composants principaux

### Scraping et collecte de données
- Scraping de Vestiaire Collective
- Extraction des prix, détails et historique
- Stockage structuré en base de données

### Agents IA
- Agent Extracteur : Analyse des caractéristiques des produits
- Agent Comparateur : Recherche de produits similaires
- Agent Évaluateur : Estimation de valeur
- Agent Tendances : Analyse de marché et tendances

### Workflows n8n
- Orchestration du processus end-to-end
- Intégration des différents composants
- Automatisation des tâches récurrentes

## 🚀 Roadmap

### Phase 1 : Infrastructure de base
- [x] Mise en place des dépôts GitHub
- [ ] Configuration de l'environnement n8n
- [ ] Création de la structure de base de données

### Phase 2 : Collecte de données
- [ ] Développement des scrapers pour Vestiaire Collective
- [ ] Mise en place du stockage des données
- [ ] Validation et nettoyage des données

### Phase 3 : Modèles IA
- [ ] Développement des agents IA de base
- [ ] Intégration avec les données collectées
- [ ] Entraînement des modèles initiaux

### Phase 4 : Améliorations futures
- [ ] Inclusion de l'état, accessoires, popularité dans le modèle
- [ ] Analyse de tendances
- [ ] Système de recommandations et reporting

## 💻 Installation et utilisation

*Instructions détaillées à venir*

## 📊 Structure du projet

```
luxury-resale-predictor/
├── docs/               # Documentation du projet
├── workflows/          # Workflows n8n exportés
├── config/             # Fichiers de configuration
└── scripts/            # Scripts utilitaires
```

## 👥 Contribution

Les contributions sont les bienvenues ! Veuillez consulter les issues ouvertes pour voir où vous pouvez aider.

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier LICENSE pour plus de détails.
