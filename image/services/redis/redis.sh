#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

REDIS_BUILD_PATH=/bd_build/services/redis

## Install redis.
$minimal_apt_get_install -y redis-server
mkdir /etc/service/redis
cp $REDIS_BUILD_PATH/redis.runit /etc/service/redis/run

## Install logrotate.
cp $REDIS_BUILD_PATH/logrotate_redis /etc/logrotate.d/redis

## Override redis
cp $REDIS_BUILD_PATH/redis.conf /etc/redis/redis.conf
