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

    stage('execute permission to scripts'){
        steps{
            sh  '''
            chmod +x build.sh
            chmod +x deploy.sh
            '''
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
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
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
                sh '''
                scp -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/jenkins.pem deploy.sh ubuntu@ip-172-31-9-206:/home/ubuntu/
                ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/jenkins.pem ubuntu@ip-172-31-9-206 "BRANCH_NAME=${env.BRANCH_NAME} bash deploy.sh"

                ''' }
            }
        }

        stage('Deploy') {
            steps {
                echo "Trigger deployment here based on branch: ${env.BRANCH_NAME}"
            }
        }
    }
}
