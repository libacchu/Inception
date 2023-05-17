#!/bin/sh -i

mysql_install_db

/etc/init.d/mysql start

echo ""
echo "DB_NAME: $DB_NAME"
echo "DB_USER: $DB_USER"
echo "DB_PASS: $DB_PASS"
echo "DB_ROOT: $DB_ROOT"
echo ""


if [ -d "/var/lib/mysql/$DB_NAME" ]
then 
	echo "Database already exists"
else

mysql_secure_installation << _EOF_

Y
$DB_PASS
$DB_PASS
Y
n
Y
Y
_EOF_

echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_PASS'; FLUSH PRIVILEGES;" | mysql -uroot

#Create database and user in the database for wordpress
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'; FLUSH PRIVILEGES;" | mysql -u root

mysql -uroot -p$DB_PASS $DB_NAME

fi

/etc/init.d/mysql stop

exec "$@"