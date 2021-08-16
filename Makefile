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
	sudo mkdir -p /home/dait-atm/data
	sudo chown -R $(LOGNAME):docker /home/dait-atm
	#chmod 770 /home/dait-atm/data
	sudo docker-compose -f ./srcs/docker-compose.yml build
	sudo docker-compose -f ./srcs/docker-compose.yml up # -d

$(NAME): all

# install docker + dependencies
install:
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo \
	  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
	    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
	#sudo usermod -a -G docker $(LOGNAME)

hosts_mod:
	sudo chown $(LOGNAME) /etc/hosts
	sudo echo "# pouet pouet mon gros taxi la" >> /etc/hosts
	sudo echo "0.0.0.0 dait-atm.42.fr" >> /etc/hosts
	sudo echo "0.0.0.0 www.dait-atm.42.fr" >> /etc/hosts

stop_services :
	service nginx stop
	service mysql stop

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml down

clean:
	sudo docker container prune
	sudo docker network prune
	sudo docker volume prune
	sudo docker image prune

fclean: clean
	sudo rm -rf /home/dait-atm

re: fclean all

.PHONY: all $(NAME) install hosts_mod stop_services stop lean fclean re
