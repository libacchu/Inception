#!/bin/sh

if [ ! -f ./wp-config.php ]
then 
	# echo "WordPress: Downloading..."
	# wget http://wordpress.org/latest.tar.gz
	# tar xfz latest.tar.gz
	# rm -rf latest.tar.gz

	# wp core download --allow-root;
	# cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

	echo "WordPress: Configuring..."
	# sed -i "s/database_name_here/$MARIADB_DATABASE/g" /var/www/html/wp-config.php
	# sed -i "s/username_here/$MARIADB_USER/g" /var/www/html/wp-config.php
	# sed -i "s/password_here/$MARIADB_PASSWORD/g" /var/www/html/wp-config.php
	# sed -i "s/localhost/$MARIADB_HOST/g" /var/www/html/wp-config.php

	# echo "Copying wp-config.php"
	# cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

cat << EOF > /var/www/wp-config.php
<?php
define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${DB_USER}' );
define( 'DB_PASSWORD', '${DB_PASS}' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
require_once ABSPATH . 'wp-settings.php';
EOF
    
	echo "wp core install..."
	wp core install --allow-root --url=${DOMAIN_NAME} --title="42 Inception" --admin_user=${DB_ROOT} --admin_password=${DB_PASS} --admin_email=${DB_EMAIL};

	echo "wp user create..."
	wp user create --allow-root ${DB_USER} ${DB_EMAIL} --role=contributor --user_pass=${DB_PASS};

	echo "WordPress: Setup completed"
else
	echo "WordPress: Is already downloaded and setup"
fi

exec $@