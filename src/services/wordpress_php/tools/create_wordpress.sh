#!/bin/sh

if [ ! -f ./wordpress/wp-config.php ]
then 
	echo "WordPress: Downloading..."
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	rm -rf latest.tar.gz

	# chown -R www-data:www-data /var/www/html/wordpress;
	touch /run/php/php7.3-fpm.pid;

	RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	RUN chmod +x wp-cli.phar
	RUN cp wp-cli.phar /usr/bin/wp

	cd ./wordpress
	echo "WordPress: Configuring..."
	sed -i "s/username_here/$MYSQL_USER/g" ./wordpress/wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" ./wordpress/wp-config-sample.php
	sed -i "s/localhost_here/$MYSQL_HOSTNAME/g" ./wordpress/wp-config-sample.php
	sed -i "s/database_here/$MYSQL_DATABASE/g" ./wordpress/wp-config-sample.php

	mv ./wordpress/wp-config-sample.php ./wordpress/wp-config.php

	wp core install --allow-root --url=${WORDPRESS_URL} \
				--title=${WORDPRESS_TITLE} \
				--admin_user=${WORDPRESS_ADMIN_LOGIN} \
				--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
				--admin_email=${WORDPRESS_ADMIN_EMAIL};
	wp user create --allow-root ${WORDPRESS_USER_LOGIN} ${WORDPRESS_USER_EMAIL} --role=contributor --user_pass=${WORDPRESS_USER_PASSWORD};


	echo "WordPress: Setup completed"
else
	echo "WordPress: Is already downloaded and setup"
fi

/usr/sbin/php-fpm7.3 -F