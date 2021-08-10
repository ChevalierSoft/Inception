# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dait-atm <dait-atm@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/02 16:21:29 by dait-atm          #+#    #+#              #
#    Updated: 2021/08/10 15:59:55 by dait-atm         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= Inception

all: install hosts_mod
	docker-compose -f ./srcs/docker-compose.yml build
	docker-compose -f ./srcs/docker-compose.yml up # -d

$(NAME): all

# install docker + dependencies
install:
	sudo usermod -a -G docker $(LOGNAME)

hosts_mod:
	sudo echo "# pouet pouet mon gros taxi la" >> /etc/hosts
	sudo echo "0.0.0.0 dait-atm.42.fr" >> /etc/hosts

stop:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker container prune
	docker images prune
	docker network prune

fclean: clean

.PHONY: all $(NAME) install hosts_mod clean fclean
