pipeline {
    agent any

    stages {

        stage('Checkout SCM') {
            steps {
                echo 'Récupération du code depuis le dépôt Git...'
                checkout scm
            }
        }

        stage('Installation des dépendances') {
            steps {
                echo 'Création/nettoyage de l environnement virtuel et installation des paquets...'
                sh '''
                    rm -rf venv
                    python3 -m venv venv
                    . venv/bin/activate && pip install -r requirements.txt
                '''
            }
        }

        stage('Exécution des Tests API') {
            steps {
                echo 'Lancement des tests Robot Framework...'
                sh '''
                    . venv/bin/activate && \
                    robot -d Resultats --nostatusrc Tests/api_suite.robot
                '''
            }
        }
    }

    post {
        always {
            echo 'Publication des résultats de test Robot Framework...'
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
