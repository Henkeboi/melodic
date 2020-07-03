#!/bin/bash
xhost +local:root
XSOCK=/tmp/.X11-unix

docker run -it --rm \
 -e DISPLAY=$DISPLAY \
 -v $XSOCK:$XSOCK \
 -v $HOME/.Xauthority:/root/.Xauthority \
 --privileged \
melodic "$@"
