FROM debian:12

RUN apt update && apt install -y \
    wget \
    curl \
    php \
    php-fpm \
    php-mysql \
    mariadb-client

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

# Download WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress/* . && \
    rm -rf wordpress latest.tar.gz

# PHP-FPM runtime dir
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# Listen on port 9000
RUN sed -i 's|/run/php/php.*-fpm.sock|0.0.0.0:9000|' \
    /etc/php/*/fpm/pool.d/www.conf

# Copy setup script (IMPORTANT)
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

RUN chown -R www-data:www-data /var/www/html

CMD ["/setup.sh"]
