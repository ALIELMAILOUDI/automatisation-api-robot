# Automatisation de Tests d'API avec Robot Framework et Python

Ce projet est une démonstration complète de la création d'un framework d'automatisation de tests robuste et maintenable pour une API REST. Il met en œuvre des bonnes pratiques en combinant la syntaxe lisible de Robot Framework avec la puissance de Python, le tout intégré dans un pipeline d'Intégration Continue (CI/CD) avec Jenkins.

## ✨ Fonctionnalités Clés

*   **Approche "Keyword-Driven"** : Des tests lisibles et compréhensibles même par des personnes non-techniques grâce à des mots-clés réutilisables.
*   **Bibliothèques Python Personnalisées** : Extension des capacités de Robot Framework pour gérer des validations complexes, comme la validation de schémas JSON.
*   **Intégration Continue avec Jenkins** : Exécution automatisée des tests à chaque modification du code, garantissant une détection rapide des régressions.
*   **Reporting Détaillé** : Génération automatique de rapports et de logs clairs après chaque exécution pour une analyse facile des résultats.

## 🛠️ Technologies Utilisées

*   **Framework de Test** : `Robot Framework`
*   **Langage de Scripting** : `Python 3`
*   **Bibliothèques Robot Framework** :
    *   `RequestsLibrary` : Pour effectuer les requêtes HTTP sur l'API REST.
    *   `BuiltIn`
*   **Bibliothèques Python** :
    *   `jsonschema` : Pour la validation de la structure des réponses JSON.
*   **Serveur CI/CD** : `Jenkins` (via un `Jenkinsfile` déclaratif)
*   **API de Test** : [JSONPlaceholder](https://jsonplaceholder.typicode.com/), une API REST factice en ligne.

## 📂 Structure du Projet

```
/automatisation-api-robot/
|-- /Tests/                   # Contient les suites de tests (.robot)
|   |-- api_suite.robot
|-- /Ressources/              # Fichiers de ressources, mots-clés et variables
|   |-- mots_cles_api.resource
|   |-- variables.robot
|-- /Bibliotheques/           # Bibliothèques de test personnalisées en Python
|   |-- MaBibliothequePerso.py
|-- /Resultats/               # Dossier pour les rapports de test (ignoré par Git)
|-- .gitignore                # Fichiers et dossiers à ignorer par Git
|-- Jenkinsfile               # Définition du pipeline CI/CD pour Jenkins
|-- README.md                 # Ce fichier
|-- requirements.txt          # Dépendances Python du projet
```

## 🚀 Installation et Prérequis

Pour exécuter ce projet localement, suivez ces étapes :

1.  **Clonez le dépôt :**
    ```bash
    git clone https://github.com/ALIELMAILOUDI/automatisation-api-robot.git
    cd automatisation-api-robot
    ```

2.  **Créez et activez un environnement virtuel Python :**
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3.  **Installez les dépendances :**
    ```bash
    pip install -r requirements.txt
    ```

## ▶️ Comment Lancer les Tests

Une fois l'installation terminée, vous pouvez lancer la suite de tests avec la commande suivante à la racine du projet :

```bash
robot -d Resultats Tests/api_suite.robot
```

Les rapports de test (`report.html` et `log.html`) seront générés dans le dossier `/Resultats`.

## 🔄 Intégration Continue avec Jenkins

Ce projet inclut un `Jenkinsfile` qui définit un pipeline d'intégration continue. Les étapes du pipeline sont les suivantes :

1.  **Checkout SCM** : Récupération du code source depuis le dépôt Git.
2.  **Installation des dépendances** : Création d'un environnement virtuel propre et installation des paquets depuis `requirements.txt`.
3.  **Exécution des Tests API** : Lancement de la suite de tests Robot Framework.
4.  **Publication des Résultats** : Utilisation du plugin Robot Framework pour afficher les rapports et les tendances des résultats directement dans l'interface de Jenkins.
