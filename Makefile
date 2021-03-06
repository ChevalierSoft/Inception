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

all: hosts_mod
	sudo chmod -R 755 .
	sudo usermod -a -G docker $(LOGNAME)
	sudo mkdir -p /home/dait-atm/data
	sudo chown -R $(LOGNAME):docker /home/dait-atm
	sudo docker-compose -f ./srcs/docker-compose.yml build
	sudo chmod -R 777 /home/dait-atm/data
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

$(NAME): all

update:
	sudo apt-get update
	sudo apt-get upgrade -y

# install docker + dependencies
install:
	sudo rm -f /etc/apt/source.list.d/docker.list
	sudo apt-get update
	curl -fsSL https://get.docker.com -o get-docker.sh
	sudo sh get-docker.sh

uninstall_docker:
	sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli
	sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce

hosts_mod:
	sudo echo "# pouet pouet mon gros taxi la" >> /etc/hosts
	sudo echo "0.0.0.0 dait-atm.42.fr" >> /etc/hosts
	sudo echo "0.0.0.0 www.dait-atm.42.fr" >> /etc/hosts
	#sudo chown $(LOGNAME) /etc/hosts

stop_services :
	service nginx stop
	service mysql stop

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml down

clean: stop
	sudo docker container prune
	sudo docker network prune
	sudo docker volume prune
	sudo docker image prune

fclean: clean
	sudo rm -rf /home/dait-atm

re: fclean all

.PHONY: all $(NAME) install hosts_mod stop_services stop lean fclean re
