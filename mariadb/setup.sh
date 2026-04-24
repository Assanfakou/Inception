#!/bin/bash

# Start MariaDB temporarily
mysqld_safe &

# Wait for MariaDB to be ready
sleep 5

# Run SQL commands
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%';

FLUSH PRIVILEGES;
EOF

# Stop temporary server
mysqladmin -u root shutdown

# Start MariaDB in foreground
exec mysqld
