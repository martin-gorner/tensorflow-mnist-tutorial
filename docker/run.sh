#!/usr/bin/env bash

# url: https://github.com/thewtex/docker-opengl-nvidia/blob/master/run.sh
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run \
	-it --rm \
	-v $XSOCK:$XSOCK:rw \
	-v $XAUTH:$XAUTH:rw \
    --device=/dev/dri/card0:/dev/dri/card0 \
	-e DISPLAY=$DISPLAY \
	-e XAUTHORITY=$XAUTH \
	-p 8888:8888 \
	-v `pwd`:/notebooks/sources/ \
	$USER/tensorflow:latest-gpu \
	"$@"
