#!/bin/sh

SCRIPT_DIR=$(dirname "$0")
. $SCRIPT_DIR/custom-env.sh

# If docker image with same name (probably previous version) exists - removing it
if [ ! -z "$(docker image ls | grep $IMAGE_NAME)" ]; then
    echo 'Docker image with same name exists - removing it'
    docker image rm $IMAGE_NAME
fi

docker build -t $IMAGE_NAME $SCRIPT_DIR/src