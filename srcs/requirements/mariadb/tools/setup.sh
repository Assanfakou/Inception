#!/bin/bash

set -x
set -e
# Derectorys for socket and change there ownership to mysql
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

# Initialize new database
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB int the baground for setup and stop it later by
# 	it's process id
mysqld --user=mysql &
pid="$!"

# whaiting fo the database to get readdy 
until mysqladmin ping --silent 2>/dev/null; do
    echo "Waiting for MariaDB..."
    sleep 1
done

if ! mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "USE $MYSQL_DATABASE;" 2>/dev/null; then
	# Create database and users and set there password
	mysql <<EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF
fi

# kill the setup process that was running 
kill $pid && wait $pid

#execute the mysql to be started as a container
exec mysqld --user=mysql
