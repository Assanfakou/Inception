From debian:12

RUN apt update && apt install -y php-fpm php php-mysql wget

RUN mkdir -p /var/www/html/ 

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php \
    -O /var/www/html/adminer.php

#RUN mkdir -p /run/php
RUN sed -i 's|/run/php/php.*-fpm.sock|0.0.0.0:9000|' \
    /etc/php/*/fpm/pool.d/www.conf

CMD ["php-fpm8.2", "-F"]
