FROM debian:buster

RUN apt-get update && apt-get install -y \
	php7.4 \
	php-fpm \
	wget \

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN mkdir /run/php

COPY ./tools/create_wordpress.sh /usr/local/bin
ENTRYPOINT [ "create_wordpress.sh" ]

WORKDIR /var/www/html

CMD [ "usr/sbin/php-fpm7.4", "-F" ]