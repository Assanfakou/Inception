FROM debian:12

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

# Create required directory for socket
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY setup.sh /setup.sh 
RUN chmod +x /setup.sh

# Fix permissions for database
RUN chown -R mysql:mysql /var/lib/mysql
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

USER mysql

CMD ["/setup.sh"]
