### PHP-FPM FastCGI Process Management
    Php-FPM is an implementaion conaining some feauturs useful for heavy-loaded sites;
        1- advanced process managemnent with stop/start.
        2- configure the stdout or stderr of the loggin.
        2- emergency of restart in case of accidental cash destraction.
### the instalation in wordpress
    1-`php-fpm` runs php (the engin that processes the wordpress code).
    2-`php-mysql` the bridge that lets php talk to mariadb database.
    3-`mariadb-client` allows the container script to interact with database.
       necessary so can container send commands to database container.
    4-`wp-cli` command line tool lets us to install wordpress without using browser.
    5-`sed -i 's|/run/php/php.*-fpm.sock|0.0.0.0:9000|' /etc/php/*/fpm/pool.d/www.conf`
        by default php lestens on local file socket. with this line here we change it to 
        listen in port 9000 so nginx could connect with it over the network.

## comands
    `cat /etc/php/*/fpm/pool.d/www.conf | grep listen`
        this command to list the listen port of the server for database.

## general commands of docker
    1-`docker exec` run an existing container .
    2-`docker run` runs an isolated container, means not conected to the others if 
    it depends on other container.
    3-`docker compose down -v docker network prune -f docker system prune -f
      docker compose up --build` these commands for cleaning the networks and cash and stuff.

## docker file or compose comands or syntax
    1-`WORKDIR`: this comand after will be executed in this folder after that syntax.
## nginx Dockerfile commands
    cerrificates cmands;
    1- `openssl req` create a certificate request.
    2-`-x509` create a self signed certificate.
    3-`-nodes` no password on the private key. no manual password
    nginx must start automatically.
    4- `-days 333` certificate is valid for this period.
    5-`newkey rsa:2048` creat new key pair private and public.
        rsa ; encryption strength.
    6-`keyout` save private key in path used by nginx to dycrypt the traffic.
    7-`out` save the certificate in path.
    8-`subj` identity info inside the certificate .
    so nginx used this certificate to enable HTTPS.
