# wordpress Dockerfile

FROM debian:buster

RUN mkdir -p /run/php
RUN mkdir -p /var/www/my_server

RUN	apt update
RUN	apt-get install -y php7.3 \
	php7.3-fpm \
	php7.3-mysqli \
	php7.3-curl \
	php7.3-json \
	php7.3-bz2 \
	php7.3-xml \
	php7.3-iconv \
	php7.3-mbstring \
	php7.3-opcache \
	php7.3-gd \
	php7.3-zip
RUN apt-get install -y mariadb-client
RUN	apt-get install -y gettext wget vim curl procps
RUN	rm -rf /var/cache/apk/*

#  ssl
#RUN mkdir -p /etc/ssl/private/

COPY ./srcs/selfsigned-nginx.crt /etc/ssl/certs/
COPY ./srcs/selfsigned-nginx.key /etc/ssl/private/
COPY ./srcs/dhparam.pem /etc/ssl/certs/
COPY ./srcs/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY ./srcs/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

# giving the rights to the wordpress dir
RUN mkdir -p /var/www/wordpress
RUN chown -R  www-data:www-data /var/www/wordpress/
RUN chmod 777 /var/www/wordpress/
# wordpress
# COPY ./srcs/wordpress/ /var/www/html/

RUN wget https://wordpress.org/wordpress-4.8.15.tar.gz
RUN tar -xf wordpress-4.8.15.tar.gz
RUN mv /wordpress/ /var/www/html/

COPY ./srcs/wp-config.php /tmp/
COPY ./srcs/oui.php /var/www/html/
COPY ./srcs/startup-script.sh /tmp/

# listen to nginx through 9000
RUN echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo "listen.owner = www-data" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo "listen.group = www-data" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo "listen.mode = 0660" >> /etc/php/7.3/fpm/pool.d/www.conf

CMD /tmp/startup-script.sh
# CMD envsubst '$MYSQL_DB_NAME $MYSQL_USER $MYSQL_USER_PASSWORD' < /tmp/wp-config.php > /var/www/html/wp-config.php \
# 	&& php-fpm7 && nginx -g "daemon off;" && tail -f /dev/null

EXPOSE 9000 80 443
