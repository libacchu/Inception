#!/bin/sh

if ! [-f ./wp-config.php]
then 

	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	rm -rf latest.tar.gz

	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost_here/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_here/$MYSQL_DATABASE/g" wp-config-sample.php

	mv wp-config-sample.php wp-config.php

fi