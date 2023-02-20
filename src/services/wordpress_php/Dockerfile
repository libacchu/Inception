FROM debian:buster

RUN apt-get update && apt-get install -y \
	php \
	php-fpm \
	php-mysqli \
	wget \
	curl \
	bash \
	php-cgi \
	php-mysql \
	php-pdo \
	php-gd php-cli \
	php-mbstring

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN cp wp-cli.phar /usr/bin/wp

RUN mkdir /run/php

WORKDIR /var/www/html
COPY ./tools/create_wordpress.sh ./create_wordpress.sh
RUN chmod -R 0777 create_wordpress.sh

CMD [ "sh", "./create_wordpress.sh" ]
