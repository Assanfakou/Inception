FROM debian:12

RUN apt update && apt install -y \
    curl \
    php \
    php-fpm \
    php-mysql \
    mariadb-client

# Install WP-CLI
#wp-cli is a command line that let's us install wordpress without using browser
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

# PHP-FPM runtime dir 
# php-fpm needs a folder wher to store it's runtime files.
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# Listen on port 9000
RUN sed -i 's|/run/php/php.*-fpm.sock|0.0.0.0:9000|' \
    /etc/php/*/fpm/pool.d/www.conf

# Copy setup script (IMPORTANT)
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

RUN chown -R www-data:www-data /var/www/html

CMD ["/setup.sh"]
