FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server \
	mariadb-client && rm -rf /var/lib/apt/lists/*

# COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY mariadb.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sql

EXPOSE 3306

COPY mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh


ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]