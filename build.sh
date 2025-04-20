#!/bin/bash

echo "Current Branch: $BRANCH_NAME"

if [ "$BRANCH_NAME" == "dev" ]; then
    docker build -t dhamu231/guvi_dev .
    #echo "Dhamu@123" | docker login -u "dhamu231" --password-stdin
    docker push dhamu231/dev-react-app:latest

elif [ "$BRANCH_NAME" == "master" ]; then
    docker build -t dhamu231/guvi_prod .
    #echo "Dhamu@123" | docker login -u "dhamu231" --password-stdin
    docker push dhamu231/prod-react-app:latest
fi