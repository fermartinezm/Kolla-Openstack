#!/bin/bash

nova-consoleauth &
nova-conductor &
nova-scheduler &
nova-novncproxy &
nova-api &
sleep 5
rm -rf /run/httpd/* /tmp/httpd*

exec /usr/sbin/apachectl -DFOREGROUND
