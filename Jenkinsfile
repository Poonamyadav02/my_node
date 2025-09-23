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
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'echo "No tests configured"'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Deploy App') {
            steps {
                sh '''
                if [ "$(docker ps -q -f name=${APP_NAME})" ]; then
                    docker stop ${APP_NAME}
                    docker rm ${APP_NAME}
                fi
                '''
                sh "docker run -d --name ${APP_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} ${DOCKER_IMAGE}"
            }
        }
    }

    post {
        success { echo "✅ Deployment completed successfully!" }
        failure { echo "❌ Deployment failed!" }
    }
}
