#!/bin/sh
SCRIPT_DIR=$(dirname "$0")
. $SCRIPT_DIR/custom-env.sh

# If docker image does not exist - building it
if [ -z "$(docker image ls | grep $IMAGE_NAME)" ]; then
    echo 'Docker image does not exist - building it'
    /bin/sh $SCRIPT_DIR/rebuild.sh
fi

docker run -it --rm --privileged \
    --env-file $SCRIPT_DIR/custom-env.sh \
    -p $HOST_PORT:8888 \
    --name $CONTAINER_NAME \
    $IMAGE_NAME