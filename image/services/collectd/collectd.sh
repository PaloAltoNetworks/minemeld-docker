#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

COLLECTD_BUILD_PATH=/bd_build/services/collectd

## Install collectd daemon.
$minimal_apt_get_install -y collectd-core rrdtool librrd4

mkdir /etc/service/collectd
cp $COLLECTD_BUILD_PATH/collectd.runit /etc/service/collectd/run

## Install logrotate.
cp $COLLECTD_BUILD_PATH/logrotate_collectd /etc/logrotate.d/collectd

## Install config
cp $COLLECTD_BUILD_PATH/collectd.conf /etc/collectd/collectd.conf
cp $COLLECTD_BUILD_PATH/minemeld_types.db /etc/collectd/minemeld_types.db

## Add collected minemeld directory
mkdir -p /var/lib/collectd/rrd/minemeld/