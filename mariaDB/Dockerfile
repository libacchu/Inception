FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& rm -rf /var/cache/apk*

EXPOSE 3306

COPY conf/mysql_setup.sh /usr/bin/mysql_setup.sh
COPY conf/setup.sql /usr/bin/setup.sql
COPY conf/50-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY conf/data-dump.sql /etc/bin/data-dump.sql


# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./tools/createdb.sql /var/www/createdb.sql

# RUN service mysql start && mysql < /var/www/createdb.sql && \
# 	rm -f /var/www/createdb.sql

CMD [ "sh", "/usr/bin/mysql_setup.sh" ]