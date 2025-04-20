#!/bin/bash

# Variables
echo "Deployment Branch:$BRANCH_NAME"
#IMAGE_NAME="dhamu231/react-app"

if  ["$BRANCH_NAME" == "dev"]; then
docker stop react-app || true
docker rm react-app || true
docker pull dhamu231/guvi_dev:latest
docker run -d -p 80:80 --name react-app dhamu231/guvi_dev:latest
elif  ["$BRANCH_NAME" == "master"]; then
docker stop react-app || true
docker rm react-app || true
docker pull dhamu231/guvi_prod:latest
docker run -d -p 80:80 --name react-app dhamu231/guvi_prod:latest
fi
echo "Deployment completed."
