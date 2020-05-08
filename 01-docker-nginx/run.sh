#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run --rm --name nginx \
    -v $DIR/../:/var/git/k8sprimitives1:ro \
    -v $DIR/../conf/default.conf:/var/conf/default.conf:ro \
    -e CONF_TEMPLATE=/var/conf/default.conf \
    -e HTML_PATH=/var/git/k8sprimitives1/resources/dogs \
    -p 8080:80 \
    -d belitre/nginx:0.1