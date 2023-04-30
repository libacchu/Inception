#!/bin/sh

if [ ! -f ./wp-config.php ]
then 
	echo "WordPress: Downloading..."
	# wget http://wordpress.org/latest.tar.gz
	# tar xfz latest.tar.gz
	# rm -rf latest.tar.gz

	wp core download --allow-root;
	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

	echo "WordPress: Configuring..."
	sed -i "s/database_name_here/$MARIADB_DATABASE/g" /var/www/html/wp-config.php
	sed -i "s/username_here/$MARIADB_USER/g" /var/www/html/wp-config.php
	sed -i "s/password_here/$MARIADB_PASSWORD/g" /var/www/html/wp-config.php
	sed -i "s/localhost/$MARIADB_HOST/g" /var/www/html/wp-config.php

	# echo "Copying wp-config.php"
	# cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

	echo "wp core install..."
	wp core install --allow-root --url=${WORDPRESS_DOMAIN_NAME} --title=${WORDPRESS_DB_DATABASE} --admin_user=${WORDPRESS_ADMIN_LOGIN} --admin_password=${WORDPRESS_ROOT_PASSWORD} --admin_email=${WORDPRESS_EMAIL};

	echo "wp user create..."
	wp user create --allow-root ${WORDPRESS_DB_USER} ${WORDPRESS_EMAIL} --role=contributor --user_pass=${MARIADB_PASSWORD};

	echo "WordPress: Setup completed"
else
	echo "WordPress: Is already downloaded and setup"
fi

exec $@