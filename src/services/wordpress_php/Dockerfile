FROM debian:buster

RUN apt-get update && apt-get install -y \
	php \
	php-fpm \
	php-mysqli \
	wget \
	curl \
	ca-certificates gnupg lsb-release \
	certbot python3-certbot-apache -y \
	bash

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

WORKDIR /var/www/html

COPY ./tools/create_wordpress.sh .

ENTRYPOINT [ "/bin/sh", "create_wordpress.sh" ]

CMD [ "usr/sbin/php-fpm7.4", "-F" ]