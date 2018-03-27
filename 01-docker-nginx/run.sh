#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run --name nginx \
    -v $DIR/../html:/var/solarstorm/html:ro \
    -v $DIR/../gifs/cats:/var/solarstorm/gifs:ro \
    -v $DIR/../conf/default.conf:/etc/nginx/conf.d/default.conf:ro \
    -p 8080:80 \
    --rm nginx