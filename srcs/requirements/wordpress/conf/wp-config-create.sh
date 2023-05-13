#!/bin/sh

if [ ! -f ./wp-config.php ]
then 
	echo "WordPress: Downloading..."
	wget https://wordpress.org/latest.zip
	unzip latest.zip
	cp -rf wordpress/* .
	rm -rf wordpress latest.zip
	rm -rf /var/www/wp-config.php

echo "WordPress: Configuring..."

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
/usr/bin/php8 /usr/local/bin/wp core install --allow-root --url=${DOMAIN_NAME} --title="42 Inception" --admin_user=${DB_ROOT} --admin_password=${DB_PASS} --admin_email=${DB_EMAIL};

echo "wp user create..."
/usr/bin/php8 /usr/local/bin/wp user create --allow-root ${DB_USER} ${USER_EMAIL} --role=contributor --user_pass=${DB_PASS};

chmod -R 0777 wp-content/

echo "WordPress: Setup completed"
else
	echo "WordPress: Is already downloaded and setup"
fi

exec $@