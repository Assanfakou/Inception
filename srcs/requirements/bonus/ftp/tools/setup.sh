#!/bin/bash

mkdir -p /var/run/vsftpd/empty

if ! id "$FTP_USER" &>/dev/null; then
    useradd -m $FTP_USER
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
fi

echo "making the /var/www/html"
mkdir -p /var/www/html

echo "changing the ownership"
chown -R $FTP_USER:$FTP_USER /var/www/html

echo "executing the config file"

exec vsftpd /etc/vsftpd.conf
