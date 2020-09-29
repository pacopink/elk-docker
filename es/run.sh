#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")";pwd)
VERSION=`cat $DIR/../VERSION`
IMG=docker.elastic.co/elasticsearch/elasticsearch:$VERSION
NAME=es

mkdir -p $DIR/data
mkdir -p $DIR/logs


docker run --rm --name $NAME  --net host -ti \
    -v $DIR/config:/usr/share/elasticsearch/config \
    -v $DIR/data:/usr/share/elasticsearch/data \
    -v $DIR/logs:/usr/share/elasticsearch/logs \
    $IMG
