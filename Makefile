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

fclean:
	docker container rm -f $$(docker container ls -aq)
	docker image rm $$(docker image ls -qa)