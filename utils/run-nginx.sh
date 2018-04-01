#!/bin/bash

cp $CONF_TEMPLATE /etc/nginx/conf.d/default.conf

sed -i "s#_HTML_PATH_#$HTML_PATH#" /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"
