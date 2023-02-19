FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server mariadb-client

COPY ./tools/mysql.sql /var/www/mysql.sql
# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN service mysql start && mysql < /var/www/mysql.sql

COPY ./tools/create_mariadb.sh /var/local/bin/
COPY ./conf/50-server.cnf /var/local/bin/

EXPOSE 3306
CMD [ "/usr/bin/mysqld_safe" ]