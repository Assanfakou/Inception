all:
	mkdir -p /home/vboxuser/data/mariadb /home/vboxuser/data/wordpress
	docker compose -f srcs/docker-compose.yaml up --build

down:
	docker compose -f srcs/docker-compose.yaml down

clean:
	docker compose -f srcs/docker-compose.yaml down -v
	sudo rm -rf /home/vboxuser/data/mariadb/* /home/vboxuser/data/wordpress/* /home/vboxuser/data/portainer/*

fclean: clean
	docker system prune -af

re: fclean all
