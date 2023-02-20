FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server mariadb-client

COPY ./tools/mysql.sql /var/www/mysql.sql
# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY ./tools/create_mariadb.sh .
# RUN chmod -R 0777 /var/local/bin/create_mariadb.sh

# RUN chown -R mysql:mysql /var/local/bin/create_mariadb.sh

COPY ./tools/mysql.sql /var/local/bin/mysql.sql
RUN chown -R mysql:mysql /var/lib/mysql/
RUN service mysql start && mysql < /var/local/bin/mysql.sql

EXPOSE 3306
USER mysql

ENTRYPOINT [ "sh", "./create_mariadb.sh" ]

CMD [ "/usr/bin/mysqld", "--skip-log-error" ]
