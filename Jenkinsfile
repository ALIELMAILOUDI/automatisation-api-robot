// Déclaration du pipeline de type déclaratif
pipeline {
    // Indique que le pipeline peut s'exécuter sur n'importe quel agent disponible
    agent any

    // Définition des différentes étapes (stages) du pipeline
    stages {
        // Stage 1: Checkout - Récupération du code source
        stage('Checkout SCM') {
            steps {
                echo 'Récupération du code depuis le dépôt Git...'
                // Cette commande récupère le code de votre dépôt configuré dans Jenkins
                checkout scm
            }
        }

        // Stage 2: Installation des dépendances
        stage('Installation des dépendances') {
            steps {
                echo 'Création/nettoyage de l_environnement virtuel et installation des paquets...'
                // On utilise sh pour exécuter des commandes shell
                sh '''
                    # Supprimer l_ancien environnement virtuel s_il existe pour un build propre
                    rm -rf venv
                    # Créer un nouvel environnement virtuel
                    python3 -m venv venv
                    # Activer l_environnement et installer les dépendances
                    . venv/bin/activate
                    pip install -r requirements.txt
                '''
            }
        }

        // Stage 3: Exécution des tests Robot Framework
        stage('Exécution des Tests API') {
            steps {
                echo 'Lancement des tests Robot Framework...'
                sh '''
                    # Activer l_environnement virtuel pour cette étape aussi
                    . venv/bin/activate
                    # Lancer les tests. --nostatusrc est CRUCIAL !
                    robot -d Resultats --nostatusrc Tests/api_suite.robot
                '''
            }
        }
    }

    // Section 'post' : Actions à exécuter après la fin de tous les stages
    post {
        // 'always' signifie que ces actions s_exécuteront toujours,
        // que les tests aient réussi ou échoué.
        always {
            echo 'Publication des résultats de test Robot Framework...'
            // Appel de la fonction du plugin Robot Framework avec les paramètres corrigés
            robot(
                outputPath: 'Resultats',
                reportFileName: 'report.html',
                logFileName: 'log.html',
                disableArchiveOutput: true,
                passThreshold: 100.0
            )
        }
    }
}
