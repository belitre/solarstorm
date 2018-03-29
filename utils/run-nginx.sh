#!/bin/bash

cp /var/git/solarstorm/conf/default.conf /etc/nginx/conf.d/default.conf

sed -i "s#_GIFS_ROOT_PATH_#$GIFS_ROOT_PATH#" /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"
