#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

#Check if the database exists

if [ -d "/var/lib/mysql/$WORDPRESS_DB_DATABASE" ]
then 

	echo "Database already exists"
else

# Set root option so that connexion without root password is not possible

mysql_secure_installation << _EOF_
Y
4242
4242
Y
n
Y
Y
_EOF_

#Add a root user on 127.0.0.1 to allow remote connexion 
#Flush privileges allow to your sql tables to be updated automatically when you modify it
#mysql -uroot launch mysql command line client
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$WORDPRESS_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Create database and user in the database for wordpress

echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_DATABASE; GRANT ALL PRIVILEGES ON $WORDPRESS_DB_DATABASE.* TO '$WORDPRESS_USER_LOGIN'@'%' IDENTIFIED BY '$WORDPRESS_USER_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

# #Import database in the mysql command line
# mysql -uroot -p $WORDPRESS_ROOT_PASSWORD $WORDPRESS_DB_DATABASE < /usr/local/bin/wordpress.sql

fi

/etc/init.d/mysql stop