#!/bin/sh

VERSION=$1
PORT=$2
PORT_WS=$3

docker run --name hivemq4 --publish $PORT:1883 --publish $PORT_WS:8000 --detach hivemq/hivemq4:$VERSION
