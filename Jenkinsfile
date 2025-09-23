pipeline {
    agent any

    environment {
        APP_NAME = 'hello-node'
        DOCKER_IMAGE = 'hello-node:latest'
        CONTAINER_PORT = '3000'
        HOST_PORT = '3000'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'echo No tests configured'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Check if Docker image exists; build only if missing
                bat '''
                docker image inspect %DOCKER_IMAGE% >nul 2>&1
                if errorlevel 1 (
                    echo Image not found, building...
                    docker build -t %DOCKER_IMAGE% "."
                ) else (
                    echo Image %DOCKER_IMAGE% already exists, skipping build.
                )
                '''
            }
        }

        stage('Deploy App') {
            steps {
                // Call the external batch script
                bat 'deploy.bat'
            }
        }
    }

    post {
        success {
            echo "✅ Deployment completed successfully!"
        }
        failure {
            echo "❌ Deployment failed!"
        }
    }
}
