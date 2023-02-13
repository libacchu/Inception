FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server mariadb-client

COPY ./tools/crate_mariadb.sh /var/local/bin/
COPY ./conf/mysql.sql /var/local/bin/

EXPOSE 3306

RUN chown -R 