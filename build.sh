#!/bin/bash

# Variables
IMAGE_NAME="dhamu231/react-app"
DEV_TAG="dev"
PROD_TAG="prod"

docker login || exit 1
docker build -t $IMAGE_NAME:$DEV_TAG .
docker push $IMAGE_NAME:$DEV_TAG
echo "Push completed"