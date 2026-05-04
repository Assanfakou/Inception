#!/bin/bash

echo "Starting WordPress setup..."

# Download WordPress files if empty (because bind mount wipes build files)
if [ ! -f /var/www/html/wp-login.php ]; then
    echo "Downloading WordPress..."
    wp core download --path=/var/www/html --allow-root
    chown -R www-data:www-data /var/www/html
fi

# Wait for MariaDB
until mysql -h mariadb -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT 1" > /dev/null 2>&1; do
    echo "Waiting for MariaDB..."
    sleep 1
done

echo "MariaDB is ready!"

cd /var/www/html

# Create wp-config.php if not exists
if [ ! -f wp-config.php ]; then
    echo "Creating wp-config.php..."
    wp config create \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="mariadb:3306" \
        --allow-root
fi

# Install WordPress if not installed
if ! wp core is-installed --allow-root; then
    echo "Installing WordPress..."
    wp core install \
        --url="https://hfakou.42.fr" \
        --title="Inception" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --allow-root
fi

echo "Starting PHP-FPM..."

exec php-fpm8.2 -F
