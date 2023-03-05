#!/bin/sh

if [ ! -f ./wordpress/wp-config.php ]
then 
	echo "WordPress: Downloading..."
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	rm -rf latest.tar.gz

	# echo "WordPress: Configuring..."
	# sed -i "s/username_here/$WORDPRESS_USER_LOGIN/g" ./wordpress/wp-config-sample.php
	# sed -i "s/password_here/$WORDPRESS_USER_PASSWORD/g" ./wordpress/wp-config-sample.php
	# sed -i "s/localhost_here/$WORDPRESS_DOMAIN_NAME/g" ./wordpress/wp-config-sample.php
	# sed -i "s/database_here/$WORDPRESS_DB_DATABASE/g" ./wordpress/wp-config-sample.php

	# cp ./wordpress/wp-config-sample.php ./wordpress/wp-config.php

	# wp core install --allow-root --url=${WORDPRESS_DOMAIN_NAME} \
	# 			--title=${WORDPRESS_DB_DATABASE} \
	# 			--admin_user=${WORDPRESS_ADMIN_LOGIN} \
	# 			--admin_password=${WORDPRESS_ROOT_PASSWORD} \
	# 			--admin_email=${WORDPRESS_EMAIL};

	# wp user create --allow-root ${WORDPRESS_USER_LOGIN} \
	# 		${WORDPRESS_EMAIL} \
	# 		--role=contributor \
	# 		--user_pass=${WORDPRESS_USER_PASSWORD};

	echo "WordPress: Setup completed"
else
	echo "WordPress: Is already downloaded and setup"
fi

exec $@
