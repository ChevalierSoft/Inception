# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dait-atm <dait-atm@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/02 16:21:29 by dait-atm          #+#    #+#              #
#    Updated: 2021/08/02 17:25:17 by dait-atm         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= Inception

all:
	docker-compose -f ./srcs/docker-compose.yml build
	docker-compose -f ./srcs/docker-compose.yml up -d

$(NAME): all

# install docker + dependencies
install:

stop:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker images prune
	docker container prune
	docker network prune

fclean: clean

.PHONY: all $(NAME) install clean fclean
