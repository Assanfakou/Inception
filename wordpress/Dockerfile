FROM debian:bullseye

RUN apt update && apt upgrade -y && \
    apt install -y \
    wget \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    mariadb-client

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress/* . && \
    rm -rf wordpress latest.tar.gz

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

RUN sed -i 's|/run/php/php7.4-fpm.sock|0.0.0.0:9000|' /etc/php/7.4/fpm/pool.d/www.conf

COPY conf/wp-config.php /var/www/html/wp-config.php

RUN chown -R www-data:www-data /var/www/html

CMD ["php-fpm7.4", "-F"]
