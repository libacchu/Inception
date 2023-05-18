CONTAINERS = (docker container ls -a -q)
IMAGES = (docker image ls -q)

all: volumes up

volumes:
	@mkdir -p $(HOME)/data
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/mariadb

domain:
	echo "127.0.0.1 libacchu.42.fr" >> /etc/hosts

up:	
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

down:
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

build:
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

conclean:
	docker container rm -f $$(docker container ls -aq)

imgclean:
	docker image rm $$(docker image ls -qa)

ps:
	docker ps

prune:
	docker system prune -af
	sudo rm -rf $(HOME)/data

fclean: down prune

re: fclean all

.PHONY: all domain up down fclean prune volumes re ps