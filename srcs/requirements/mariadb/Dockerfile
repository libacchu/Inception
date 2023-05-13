FROM debian:buster

ARG DB_NAME \
    DB_USER \
    DB_PASS \
    DB_ROOT \
    DB_EMAIL \
    DOMAIN_NAME

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

RUN rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY ./requirements/mariadb/conf/create_db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_db.sh

COPY ./requirements/mariadb/tools/mariadb.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sql

RUN chown -R mysql:mysql /var/lib

RUN /usr/local/bin/create_db.sh

CMD ["mysqld", "--bind-address=0.0.0.0"]