#!/bin/bash

/usr/libexec/mysql-prepare-db-dir mariadb.service
exec /usr/bin/mysqld_safe --basedir=/usr
