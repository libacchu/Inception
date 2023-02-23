
if [ ! -d /var/lib/mysql/Inception_DataBase ]; then
	echo "installing database"
	sudo mysql_secure_installation --user=mysql --ldata=/var/lib/mysql

	#mkdir /var/run/mysqld
	chown -R mysql:root /var/run/mysqld


	sed -i "s/WORDPRESS_DB_USER/$WORDPRESS_DB_USER/g" /usr/bin/setup.sql
	sed -i "s/WORDPRESS_DB_PASSWORD/$WORDPRESS_DB_PASSWORD/g" /usr/bin/setup.sql
	sed -i "s/WORDPRESS_DB_NAME/$WORDPRESS_DB_NAME/g" /usr/bin/setup.sql
	sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" /usr/bin/setup.sql

	(sleep 3; mariadb -u wordpress --password=$WORDPRESS_DB_PASSWORD $WORDPRESS_DB_NAME < /etc/bin/data-dump.sql; echo "imported database") &

	exec mysqld --user=mysql --init-file=/usr/bin/setup.sql
else
	exec mysqld --user=mysql
fi
