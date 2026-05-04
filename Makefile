all:
	mkdir -p /home/hfakou/data/mariadb /home/hfakou/data/wordpress
	docker compose -f srcs/docker-compose.yaml up --build

down:
	docker compose -f srcs/docker-compose.yaml down

clean:
	docker compose -f srcs/docker-compose.yaml down -v
	sudo rm -rf /home/hfakou/data/mariadb/* /home/hfakou/data/wordpress/*

fclean: clean
	docker system prune -af

re: fclean all
