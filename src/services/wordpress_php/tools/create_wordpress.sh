#!/bin/sh

if [ ! -f ./wordpress/wp-config.php ]
then 
	echo "WordPress: Downloading..."
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	rm -rf latest.tar.gz

	cd ./wordpress
	echo "WordPress: Configuring..."
	sed -i "s/username_here/$MYSQL_USER/g" ./wordpress/wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" ./wordpress/wp-config-sample.php
	sed -i "s/localhost_here/$MYSQL_HOSTNAME/g" ./wordpress/wp-config-sample.php
	sed -i "s/database_here/$MYSQL_DATABASE/g" ./wordpress/wp-config-sample.php

	mv ./wordpress/wp-config-sample.php ./wordpress/wp-config.php

	echo "WordPress: Setup completed"
else
	echo "WordPress: Is already downloaded and setup"
fi

exec $@