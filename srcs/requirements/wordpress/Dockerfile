FROM alpine:3.17
ARG PHP_VERSION=8 \
    DB_NAME \
    DB_USER \
    DB_PASS \
    DB_ROOT \
    DB_EMAIL \
    DOMAIN_NAME

RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
    php${PHP_VERSION}-phar \
    curl \
    wget \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www
# RUN wget https://wordpress.org/latest.zip && \
#     unzip latest.zip && \
#     cp -rf wordpress/* . && \
#     rm -rf wordpress latest.zip && rm -rf /var/www/wp-config.php

COPY ./requirements/wordpress/conf/wp-config-create.sh .
RUN chmod +x wp-config-create.sh
ENTRYPOINT [ "/var/www/wp-config-create.sh" ]

CMD ["/usr/sbin/php-fpm8", "-F"]