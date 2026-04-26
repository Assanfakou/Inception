FROM debian:12

RUN apt update && apt upgrade -y && \
    apt install -y nginx openssl

# Create SSL certificate
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=MA/ST=Casablanca/L=Casablanca/O=42/OU=student/CN=localhost"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
