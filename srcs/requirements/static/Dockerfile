FROM debian:12

RUN apt-get update && apt install -y nginx

COPY www/index.html /var/www/html/

WORKDIR var/www/html

CMD ["nginx", "-g", "daemon off;"]


