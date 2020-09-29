#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")";pwd)
VERSION=`cat $DIR/../VERSION`
IMG="docker.elastic.co/logstash/logstash:$VERSION"
NAME=logstash

docker run --rm --name $NAME  --net host -ti \
    -v $DIR/config:/usr/share/logstash/config \
    $IMG /usr/share/logstash/bin/logstash -f /usr/share/logstash/config/logstash.conf
