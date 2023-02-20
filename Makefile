# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: libacchu <libacchu@student.42wolfsburg.de> +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/28 15:51:29 by libacchu          #+#    #+#              #
#    Updated: 2023/01/28 15:51:30 by libacchu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CONTAINERS = (docker container ls -a -q)
IMAGES = (docker image ls -q)

all: volumes up

volumes:
	@mkdir -p $(HOME)/data
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/db

domain:
	echo "127.0.0.1 libacchu.42.fr" >> /etc/hosts

up:	volumes
	docker compose -f ./src/docker-compose.yml up -d

down:
	docker compose -f ./src/docker-compose.yml down

conclean:
	docker container rm -f $$(docker container ls -aq)

imgclean:
	docker image rm $$(docker image ls -qa)

prune:
	docker system prune -af
	rm -rf $(HOME)/data

fclean: down prune

re: fclean all

ps:
	docker ps

.PHONY: all domain up down fclean prune volumes re