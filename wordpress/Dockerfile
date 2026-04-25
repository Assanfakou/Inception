FROM debian:12

RUN apt update && apt upgrade -y && \
    apt install -y wget php php-fpm php-mysql mariadb-client && \
    mkdir -p /var/www/html

WORKDIR /var/www/html

# Install WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress/* . && \
    rm -rf wordpress latest.tar.gz

COPY conf/wp-config.php /var/www/html/wp-config.php

RUN chown -R www-data:www-data /var/www/html

CMD ["php-fpm7.4", "-F"]
