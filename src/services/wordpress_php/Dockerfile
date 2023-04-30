FROM debian:buster

RUN apt-get update && apt-get install -y \
	php \
	php-cgi \
	php-fpm \
	php-mysqli \
	php-curl \
	php-gd \
	php-mbstring \
	php-xml \
	php-zip \
	php-json \
	php-dom \
	php-exif \
	php-fileinfo \
	wget \
	curl \
	bash

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/

RUN mkdir /run/php

COPY ./tools/create_wordpress.sh /usr/local/bin/create_wordpress.sh

RUN chmod -R 0777 /usr/local/bin/create_wordpress.sh

WORKDIR /var/www/html/

VOLUME [ "/var/www/html/" ]

ENTRYPOINT [ "/usr/local/bin/create_wordpress.sh" ]

EXPOSE 9000

CMD [ "/usr/sbin/php-fpm7.3", "-F" ]