FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/
COPY create_database.sql /var/www/

EXPOSE 3306

COPY mariadb.sh ./mariadb.sh
RUN chmod +x mariadb.sh
RUN ./mariadb.sh
# RUN service mysql start && mysql < /var/www/create_database.sql
# Expose the default MariaDB port

# Start the MariaDB service
CMD ["mysqld", "--bind-address=0.0.0.0"]