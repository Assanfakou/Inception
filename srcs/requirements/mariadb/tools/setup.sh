#!/bin/bash

# Create required runtime directory
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

# Start MariaDB in initialization mode (no networking)
mysqld --user=mysql --skip-networking &
pid="$!"

# Wait until MariaDB is ready
until mysqladmin ping --silent; do
	sleep 1
done

# Initialize database using environment variables
mysql <<EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

FLUSH PRIVILEGES;
EOF

# Stop temporary MariaDB instance
kill "$pid"
wait "$pid"

# Start final MariaDB process (keeps container alive)
exec mysqld --user=mysql
