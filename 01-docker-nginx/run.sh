#!/bin/bash

docker run --rm --name nginx \
    -v $HOME/solarstorm:/var/git/solarstorm:ro \
    -v $HOME/solarstorm/conf/default.conf:/var/conf/default.conf:ro \
    -e CONF_TEMPLATE=/var/conf/default.conf \
    -e HTML_PATH=/var/git/solarstorm/resources/cats \
    -p 8080:80 \
    -d belitre/nginx:0.1