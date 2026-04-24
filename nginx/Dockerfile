 FROM debian:12

 RUN apt-get update && apt-get install -y nginx && apt-get install -y vim 

 COPY www/ /var/www/html/
 COPY conf/nginx.conf /etc/nginx/nginx.conf

 EXPOSE 80

 CMD ["nginx", "-g", "daemon off;"]
