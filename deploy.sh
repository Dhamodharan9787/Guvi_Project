#!/bin/bash

# Variables
echo "Deployment Branch:$BRANCH_NAME"
IMAGE_NAME="dhamu231/react-app"
docker stop react-app || true
docker rm react-app || true
if  ["$BRANCH_NAME" == "dev"]; then
docker pull dhamu231/guvi_dev:latest
docker run -d --name react-app -p 80:80 dhamu231/guvi_dev:latest
elif  ["$BRANCH_NAME" == "master"]; then
docker pull dhamu231/guvi_prod:latest
docker run -d --name react-app -p 80:80 dhamu231/guvi_prod:latest
fi
echo "Deployment completed."
