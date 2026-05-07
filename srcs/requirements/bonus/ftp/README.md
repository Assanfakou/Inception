# FTP (vsftpd) in Docker — Full Explanation (Inception Project)

---

# 1. What FTP is

FTP means:

File Transfer Protocol

Its job is simple:

Transfer files between a client and a server.

In your project:

* Your computer (FTP client)
* vsftpd container (FTP server)
* Shared Docker volume (/var/www/html)

So FTP becomes a way to access WordPress files remotely.

---

# 2. Architecture in your project

You now have 4 services:

* nginx → serves website (HTTP/HTTPS)
* wordpress → runs PHP code
* mariadb → database storage
* ftp → file transfer system

They communicate through Docker network + shared volume.

---

# 3. How FTP works internally

FTP uses TWO connections:

## 3.1 Control connection

* Port: 21
* Used for commands

Examples:

* login
* list files
* upload request

---

## 3.2 Data connection

* Used for file transfer
* Uses passive ports (10000–10100 in your config)

Why?

* separates commands from data
* avoids firewall/Docker issues

---

# 4. vsftpd configuration file explained

---

## listen=YES

Runs vsftpd as standalone server.

---

## anonymous_enable=NO

Disables anonymous login.
Security feature.

---

## local_enable=YES

Allows Linux system users to log in.

---

## write_enable=YES

Allows file upload / delete / modify.

---

## local_umask=022

Controls default file permissions.

---

## pasv_enable=YES

Enables passive mode (important for Docker).

---

## connect_from_port_20=YES

Uses FTP standard data port behavior.

---

## user_sub_token=$USER

Used for dynamic user directory mapping.

---

## local_root=/var/www/html

IMPORTANT:

This sets the FTP root directory.

Meaning:

* FTP users land inside WordPress files

---

## chroot_local_user=YES

Security feature:

* locks user inside their directory
* prevents accessing system files

---

## allow_writeable_chroot=YES

Allows writable directories inside chroot.
Needed for WordPress volume.

---

## secure_chroot_dir=/var/run/vsftpd/empty

Required empty safe directory.
Must exist or FTP will crash.

---

## pam_service_name=vsftpd

Uses Linux authentication system (PAM).

---

## pasv_min_port / pasv_max_port

Defines passive port range for data transfer.

Must match Docker exposed ports.

---

# 5. setup.sh explained

This script prepares FTP every time container starts.

---

## mkdir -p /var/run/vsftpd/empty

Creates required system directory.

---

## mkdir -p /var/www/html

Ensures shared volume exists.

---

## Check if user exists

Prevents duplication errors:

if user does not exist → create it

---

## useradd -m FTP_USER

Creates Linux user for FTP login.

---

## chpasswd

Sets FTP user password.

---

## exec vsftpd /etc/vsftpd.conf

Starts FTP server.

IMPORTANT:

* replaces shell process
* keeps container alive

---

# 6. Why setup script exists

Dockerfile builds image once.

But setup.sh runs every container start:

Used for:

* environment variables
* first-time setup
* runtime configuration

---

# 7. How FTP connects to WordPress

Key idea: SHARED VOLUME

* FTP container writes files
* WordPress reads same files
* nginx serves them

So:

FTP → /var/www/html
WordPress → /var/www/html
Nginx → /var/www/html

All share same storage.

---

# 8. FTP workflow

1. Client connects to port 21
2. Logs in using user/password
3. Server assigns directory (/var/www/html)
4. Client uploads file
5. File appears instantly in WordPress

---

# 9. Common error you faced

## "500 OOPS secure_chroot_dir"

Meaning:

* missing required directory

Fix:

* create /var/run/vsftpd/empty

---

## "cannot bind port 21"

Meaning:

* FTP already running
* or duplicate process

---

# 10. Final mental model

FTP does NOT know WordPress.

It only knows filesystem:

FTP = file access layer

WordPress = application layer

Shared volume = connection between them

---

# 11. Summary

You built:

* Secure FTP server
* Docker integration
* Shared persistent volume
* Multi-service architecture

This is exactly what the Inception bonus expects.

