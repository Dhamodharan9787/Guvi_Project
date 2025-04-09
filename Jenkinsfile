pipeline {
    agent any

    environment {
        DOCKER_DEV_REPO = 'dhamu231/guvi_dev'
        DOCKER_PROD_REPO = 'dhamu231/guvi_prod'
        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

    stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-hub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        echo "Dhamu@123" | docker login -u "dhamu231" --password-stdin
                    '''
                }
            }
        }

        stage('Build & push  Docker Image') {
            steps {
                sh './build.sh'
            }
        }

        stage('Tag & Push Docker Image') {
            steps {
                sh './deploy.sh'
            }
        }

        stage('Deploy') {
            steps {
                echo "Trigger deployment here based on branch: ${env.BRANCH_NAME}"
            }
        }
    }
}
