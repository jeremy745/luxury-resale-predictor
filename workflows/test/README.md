# Workflows de Test

Ce dossier contient des workflows n8n destinés à tester différentes fonctionnalités du système de prédiction de prix.

## Contenu

- `hermes_kelly_scraper.json` - Workflow pour tester le scraper de sacs Hermès Kelly

## Comment utiliser ces workflows

### Prérequis
- n8n installé (local ou cloud)
- Le code du scraper déployé sur votre machine ou serveur

### Importation dans n8n

1. Ouvrez votre instance n8n
2. Cliquez sur "Workflows" dans le menu de gauche
3. Cliquez sur le bouton "Import from File" en haut à droite
4. Sélectionnez le fichier JSON du workflow à importer
5. Une fois importé, le workflow apparaîtra dans votre liste de workflows

### Configuration du workflow "Hermes Kelly Scraper"

Avant d'exécuter ce workflow, vous devez ajuster les paramètres suivants :

1. Ouvrez le workflow importé
2. Sélectionnez le nœud "Set Scraper Path"
3. Modifiez la ligne suivante pour pointer vers l'emplacement réel du script du scraper sur votre système :
   ```javascript
   const scraperPath = "/chemin/vers/votre/dépôt/luxury-scrapers/tests/prototypes/vestiaire_scraper.js";
   ```
4. Si vous souhaitez modifier les paramètres de recherche, ajustez également ces valeurs :
   ```javascript
   brand: "Hermès",
   model: "Kelly",
   maxPages: 2
   ```

5. Pour les nœuds "Success Email" et "Error Email", configurez vos destinataires et serveur SMTP

### Exécution du workflow

1. Une fois configuré, cliquez sur le bouton "Execute Workflow" en haut à droite
2. Vous pouvez suivre l'exécution en temps réel dans l'interface n8n
3. Une fois terminé, vous recevrez soit :
   - Un email de succès avec les données des sacs Hermès Kelly trouvés
   - Un email d'erreur en cas de problème avec le scraper

## Structure du workflow Hermes Kelly

Le workflow se compose des étapes suivantes :

1. **Start** - Déclencheur manuel du workflow
2. **Set Scraper Path** - Définit le chemin vers le script de scraping et les paramètres
3. **Execute Scraper** - Exécute le script avec Node.js
4. **Process Results** - Analyse la sortie JSON et calcule des statistiques
5. **Merge** - Combine les résultats
6. **IF** - Vérifie si le scraping a réussi ou échoué
7. **Success Email** - Envoie un email avec les résultats formatés en HTML
8. **Error Email** - Envoie un email avec les détails de l'erreur

## Adaptation à n8n Cloud

Si vous utilisez n8n Cloud, vous devez adapter ce workflow car il utilise un nœud "Execute Command" qui nécessite un accès au système de fichiers local.

Options d'adaptation :
1. Héberger le script sur un serveur accessible via HTTP et utiliser un nœud "HTTP Request"
2. Convertir le script en API serverless et l'appeler depuis n8n
3. Réimplémenter la logique du scraper directement dans n8n avec JavaScript

## Dépannage

Si vous rencontrez des erreurs :

1. **Script introuvable** - Vérifiez le chemin dans le nœud "Set Scraper Path"
2. **Erreur d'exécution** - Assurez-vous que Node.js est installé et que les dépendances sont installées
3. **Problèmes de parsing** - Vérifiez la sortie brute pour comprendre ce qui ne va pas
4. **Erreurs de scraping** - Vérifiez si les sélecteurs CSS dans le script sont toujours valides

## Prochaines étapes

- Ajouter un déclencheur temporel pour exécuter le scraper régulièrement
- Stocker les résultats dans une base de données
- Ajouter des workflows pour d'autres marques et modèles
- Intégrer les agents d'IA pour l'analyse des prix
