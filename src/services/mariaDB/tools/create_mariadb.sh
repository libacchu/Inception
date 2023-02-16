#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

if [ "/var/lib/mysql/" ]

	chown -R mysql:root /var/run/mysqld

	sed -i "s/WORDPRESS_DB_USER/$WORDPRESS_DB_USER/g" /usr/bin/setup.sql
	sed -i "s/WORDPRESS_DB_PASSWORD/$WORDPRESS_DB_PASSWORD/g" /usr/bin/setup.sql
	sed -i "s/WORDPRESS_DB_NAME/$WORDPRESS_DB_NAME/g" /usr/bin/setup.sql
	sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" /usr/bin/setup.sql