FROM debian:12

RUN apt-get update && apt install -y python3

COPY www/index.html /var/www/html/

WORKDIR var/www/html

CMD ["python3", "-m", "http.server", "8081"]


