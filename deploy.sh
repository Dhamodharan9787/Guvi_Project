#!/bin/bash

# Variables
IMAGE_NAME="dhamu231/react-app"
PROD_TAG="prod"
SERVER_USER="dhamu"
SERVER_IP="172.30.147.104"

docker tag $IMAGE_NAME:dev $IMAGE_NAME:$PROD_TAG
docker push $IMAGE_NAME:$PROD_TAG

ssh $SERVER_USER@$SERVER_IP << 'EOF'
    docker pull dhamu231/react-app:prod
    docker stop react-app || true
    docker rm react-app || true
    docker run -d --name react-app -p 80:80 dhamu231/react-app:prod
EOF

echo "Deployment completed."
