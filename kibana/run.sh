#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")";pwd)
VERSION=`cat $DIR/../VERSION`
IMG="docker.elastic.co/kibana/kibana:$VERSION"
NAME=kibana
mkdir -p $DIR/data

docker run --rm --name $NAME  --net host -ti \
    -v $DIR/config:/usr/share/kibana/config \
    -v $DIR/data:/usr/share/kibana/data \
    $IMG
