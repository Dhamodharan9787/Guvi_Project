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

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t react-app .'
            }
        }

        stage('Tag & Push Docker Image') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh """
                            docker tag myapp $DOCKER_DEV_REPO:$IMAGE_TAG
                            docker push $DOCKER_DEV_REPO:$IMAGE_TAG
                        """
                    } else if (env.BRANCH_NAME == 'master') {
                        sh """
                            docker tag myapp $DOCKER_PROD_REPO:$IMAGE_TAG
                            docker push $DOCKER_PROD_REPO:$IMAGE_TAG
                        """
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Trigger deployment here based on branch: ${env.BRANCH_NAME}"
            }
        }
    }
}
