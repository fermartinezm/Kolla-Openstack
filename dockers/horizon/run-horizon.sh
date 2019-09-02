#!/bin/bash

FILE=/start_httpd
while [ ! -f $FILE ]
do
  sleep 3
done

rm -rf /run/httpd/* /tmp/httpd*

exec /usr/sbin/apachectl -DFOREGROUND
