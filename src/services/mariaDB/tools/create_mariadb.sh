#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

if [ "/var/lib/mysql/" ]