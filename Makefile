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

all: stop_services install hosts_mod
	sudo docker-compose -f ./srcs/docker-compose.yml build
	sudo docker-compose -f ./srcs/docker-compose.yml up # -d

$(NAME): all

# install docker + dependencies
install:
	mkdir -p ~/data
	#sudo usermod -a -G docker $(LOGNAME)

hosts_mod:
	sudo chown $(LOGNAME) /etc/hosts
	sudo echo "# pouet pouet mon gros taxi la" >> /etc/hosts
	sudo echo "0.0.0.0 dait-atm.42.fr" >> /etc/hosts
	sudo echo "0.0.0.0 www.dait-atm.42.fr" >> /etc/hosts

stop_services :
	#service nginx stop
	#service mysql stop

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml down

clean:
	sudo docker container prune
	sudo docker images prune
	sudo docker network prune

fclean: clean
	#rm -rf ~/data

.PHONY: all $(NAME) install hosts_mod stop_services stop lean fclean
