#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

NGINX_BUILD_PATH=/bd_build/services/nginx

## Install nginx.
$minimal_apt_get_install -y nginx
mkdir /etc/service/nginx
cp $NGINX_BUILD_PATH/nginx.runit /etc/service/nginx/run

## Install logrotate.
cp $NGINX_BUILD_PATH/logrotate_nginx /etc/logrotate.d/nginx
