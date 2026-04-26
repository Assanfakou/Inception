### PHP-FPM FastCGI Process Management
    Php-FPM is an implementaion conaining some feauturs useful for heavy-loaded sites;
        1- advanced process managemnent with stop/start.
        2- configure the stdout or stderr of the loggin.
        2- emergency of restart in case of accidental cash destraction.
### the instalation in wordpress
    1-`php7.4-fpm` runs php (the engin).
    2-`php7.4` provides the base PHP envirement.
    3-`php7.4-mysql` allows PHP to talk to mariadb.
    4-`mariadb-client` allows the container script to interact with database.
## comands
    `cat /etc/php/*/fpm/pool.d/www.conf | grep listen`
        this command to list the listen port of the server for database.

## general commands of docker
    1-`docker exec` run an existing container .
    2-`docker run` runs an isolated container, means not conected to the others if 
    it depends on other container.
    3-`docker compose down -v docker network prune -f docker system prune -f
      docker compose up --build` these commands for cleaning the networks and cash and stuff.
