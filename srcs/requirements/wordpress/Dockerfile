FROM debian:buster

RUN mkdir -p /run/nginx
RUN mkdir -p /var/www/my_server

RUN	apt update
	&& php7 \
	&& php7-fpm \
	&& php7-mysqli \
	&& php7-curl \
	&& php7-json \
	&& php7-session \
	&& php7-bz2 \
	&& php7-xml \
	&& php7-iconv \
	&& php7-mbstring \
	&& php7-opcache \
	&& php7-gd \
	&& php7-zlib \
	&& gettext \
	&& wget \
	&& vim \
	&& rm -rf /var/cache/apk/*

# &&	apt-get install -y nginx \

# nginx config
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/my_server/

#  ssl
#RUN mkdir -p /etc/ssl/private/

COPY ./srcs/selfsigned-nginx.crt /etc/ssl/certs/
COPY ./srcs/selfsigned-nginx.key /etc/ssl/private/
COPY ./srcs/dhparam.pem /etc/ssl/certs/
COPY ./srcs/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY ./srcs/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

# wordpress
# COPY ./srcs/wordpress/ /var/www/html/

RUN wget https://wordpress.org/wordpress-4.8.15.tar.gz
RUN tar -xf wordpress-4.8.15.tar.gz
RUN mv /wordpress/ /var/www/html/

COPY ./srcs/wp-config.php /tmp/
COPY ./srcs/oui.php /var/www/html/
COPY ./srcs/startup-script.sh /tmp/

CMD /tmp/startup-script.sh
# CMD envsubst '$MYSQL_DB_NAME $MYSQL_USER $MYSQL_USER_PASSWORD' < /tmp/wp-config.php > /var/www/html/wp-config.php \
# 	&& php-fpm7 && nginx -g "daemon off;" && tail -f /dev/null

EXPOSE 9000 80
