FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/createdb.sql /var/www/createdb.sql

RUN service mysql start && mysql < /var/www/createdb.sql && \
	rm -f /var/www/createdb.sql

CMD [ "/usr/bin/mysqld_safe" ]