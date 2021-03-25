#!/bin/sh
NEXTCLOUD_VERSION=21.0.0
NEXTCLOUD_SRC=nextcloud.tar.bz2
DOCKER_REPO=binhnv56/nextcloud
DOCKER_TAG=latest

if [ ! -f "$NEXTCLOUD_SRC" ]; then
    echo "Get nextcloud src file ...."
    curl -fsSL -o nextcloud.tar.bz2 "https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2";
fi

docker build -t $DOCKER_REPO:$DOCKER_TAG .