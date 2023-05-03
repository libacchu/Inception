# name = inception

# all:
# 	@printf "Launch configuration ${name}...\n"
# 	@bash srcs/requirements/wordpress/tools/make_dir.sh
# 	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

# build:
# 	@printf "Building configuration ${name}...\n"
# 	@bash srcs/requirements/wordpress/tools/make_dir.sh
# 	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

# down:
# 	@printf "Stopping configuration ${name}...\n"
# 	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

# re: down fclean
# 	@printf "Rebuild configuration ${name}...\n"
# 	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

# clean: down
# 	@printf "Cleaning configuration ${name}...\n"
# 	@docker system prune -a --force --volumes
# 	@sudo rm -rf ~/data/wordpress/*
# 	@sudo rm -rf ~/data/mariadb/*

# fclean: clean
# 	@printf "Total clean of all configurations docker\n"
# 	@docker system prune --all --force --volumes
# 	@docker network prune --force
# 	@docker volume prune --force
# 	@sudo rm -rf ~/data/wordpress/*
# 	@sudo rm -rf ~/data/mariadb/*
# .PHONY	: all build down re clean fclean

CONTAINERS = (docker container ls -a -q)
IMAGES = (docker image ls -q)

all: volumes up

volumes:
	@mkdir -p $(HOME)/data
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/db

domain:
	echo "127.0.0.1 libacchu.42.fr" >> /etc/hosts

up:	
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

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