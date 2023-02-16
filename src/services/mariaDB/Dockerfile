FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server mariadb-client

COPY ./tools /var/www/html
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN service mysql start && mysql < /var/www/mysql.sql

COPY ./tools/crate_mariadb.sh /var/local/bin/
COPY ./conf/mysql.sql /var/local/bin/

EXPOSE 3306
CMD [ "/usr/bin/mysqld_safe" ]