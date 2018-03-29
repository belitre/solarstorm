#!/bin/bash

docker run --rm --name nginx \
    -v $HOME/solarstorm:/var/git/solarstorm:ro \
    -e GIFS_ROOT_PATH=/var/git/solarstorm/resources/cats \
    -p 8080:80 \
    belitre/nginx:0.1