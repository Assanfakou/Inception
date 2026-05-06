# Inception Project

## Q&A
  ### What is Docker ?
    - It is an open-source platform that uses containerization technology to package applications 
        and their dependencies into lightweight, portable units called "containers".

  ### What is a container ?
      - A running instance of an application, isolated from the rest of your system. 
        Think of it as a lightweight virtual machine, but faster and sharing the host OS kernel.

  ### What is an image ?
      - A read-only blueprint/snapshot used to create containers. 
        It packages your app + its dependencies + OS libraries into one bundle. 
            You run an image to get a container.

  ### What is Dockerfile ?
      - A text file with step by step instructions to build an image. 
        Like a recipe: "start from Ubuntu, install Python, copy my code, run this command."

  ### What is a Volume ?
      - A way to persist data outside the container's lifecycle. Since containers are ephemeral (data dies when they do),
        volumes mount a folder from your host machine into the container so data survives restarts.

  ### What is Docker compose ?
      -A tool to define and run multiple containers together using a single `docker-compose.yml` file.
        Instead of starting each container manually, you describe all services (app, database, cache, etc.) 
            and spin them all up with one command: `docker compose up`.

  ### What is NGINX ?
	- A web server (and reverse proxy). 
		It receives HTTP requests from browsers and serves files or forwards requests to your app.
			 Known for being fast and lightweight. Alternative to Apache.
  ### What is Mariadb ?
	- An open-source relational database a fork of MySQL. Stores data in tables with rows and columns. 
		Used by WordPress to store posts, users, settings, etc.

  ### What is Wordpress ?
	- A PHP-based CMS (Content Management System). It's a web app that lets you build and manage websites without coding. 
		It talks to a database (MariaDB/MySQL) to store content and serves pages via PHP.

  ### What is HTTP ?
	- HyperText Transfer Protocol. The rules that browsers and servers use to communicate. 
		Data is sent in plain text anyone intercepting the traffic can read it. Runs on port 80.

  ### What is HTTPS ?
	- HTTP + encryption. Same protocol but wrapped in TLS so data is encrypted in transit. 
		Nobody can intercept and read it. Runs on port 443.

  ### What is SSL ?
	- Secure Sockets Layer. The old encryption protocol for securing web traffic. 
		It's now deprecated and replaced by TLS, but people still say "SSL" casually when they mean TLS.

  ### What is TLS ?
	- Transport Layer Security. The modern, secure replacement for SSL. 
		When you visit an HTTPS site, TLS is what's actually encrypting the connection. 
			You get a TLS certificate to prove your site's identity.

  ### What is PHP ?
	- A server-side scripting language. WordPress is written in PHP. When someone visits your site, 
		the server runs PHP code which dynamically builds the HTML page and returns it to the browser.

  ### What is PHP-FPM ?
	- PHP FastCGI Process Manager. A smarter way to run PHP. Instead of running PHP inside the web server, 
		PHP-FPM runs PHP as a separate service (pool of worker processes). 
			NGINX hands off PHP requests to PHP-FPM to execute.

  ### What is FastCGI ?
	- A protocol for communication between a web server (NGINX) and an external process (like PHP-FPM). 
		NGINX doesn't run PHP itself ,it speaks FastCGI to pass the request to PHP-FPM and get the response back.

  ### What is Mariadb Server ?
	- The actual database engine process that runs on your machine/container. 
		It listens for connections, stores data, and executes queries. 
			This is what you install when you want to host a database.

  ### What is Mariadb-Client ?
	- A command-line tool `(mysql or mariadb)` you use to connect to a MariaDB server and run SQL queries manually. 
		It's just an interface, it doesn't store anything itself.

  ### What is MySQL Daemon ?
	- The background process (mysqld) that is the running MySQL/MariaDB server. 
		"d" stands for daemon. It sits silently in the background waiting for database connections.

  ### What is Daemon (in general) ?
	- A background process that runs silently without user interaction. It starts (usually at boot) and just waits to do its job,
		 serving requests, handling connections, etc. Examples: nginx (web daemon), mysqld (database daemon), sshd (SSH daemon).

  ### What is OpenSSL ?
	- A command-line toolkit and library for all things cryptography. You use it to generate TLS certificates, 
		create private keys, test HTTPS connections, and encrypt/decrypt files. It's what powers TLS under the hood on most Linux systems.

  ### What is WP-CLI ?
	- WordPress Command Line Interface. A tool to manage WordPress from the terminal, install plugins, update WordPress, 
		create users, reset passwords, run database operations, all without touching the browser. Essential for automation and Docker setups.


