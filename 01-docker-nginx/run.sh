#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run --name nginx \
    -v $DIR/../html:/usr/share/nginx/html:ro \
    -v $DIR/../gifs/cats:/usr/share/nginx/images/gifs:ro \
    -v $DIR/../conf/default.conf:/etc/nginx/conf.d/default.conf:ro \
    -p 8080:80 \
    --rm nginx