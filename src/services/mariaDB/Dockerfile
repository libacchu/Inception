FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server mariadb-client

EXPOSE 3306

COPY ./tools /var/www/html
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN service mysql start && mysql < /var/www/mysql.sql

CMD [ "/usr/bin/mysqld_safe" ]

