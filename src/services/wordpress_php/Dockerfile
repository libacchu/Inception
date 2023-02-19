FROM debian:buster

RUN apt-get update && apt-get install -y \
	php \
	php \
	php-fpm \
	php-mysqli \
	wget \
	curl \
	ca-certificates gnupg lsb-release \
	certbot python3-certbot-apache \
	bash \
	php-cgi \
	php-mysql \
	php-pdo \
	php-gd php-cli \
	php-mbstring

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN mkdir /run/php

WORKDIR /var/www/html
COPY ./tools/create_wordpress.sh .


ENTRYPOINT [ "bash", "create_wordpress.sh" ]

CMD [ "/usr/sbin/php-fpm7.3", "-F" ]
