FROM alpine:3.14

RUN	apk update
RUN apk add nginx
RUN mkdir -p /run/nginx
RUN mkdir -p /var/www/my_server
RUN	apk add php7
RUN apk add php7-fpm
RUN apk add php7-mysqli
RUN apk add php7-curl
RUN apk add php7-json
RUN apk add php7-session
RUN apk add php7-bz2
RUN apk add php7-xml
RUN apk add php7-iconv
RUN apk add php7-mbstring
RUN apk add php7-opcache
RUN apk add php7-gd
RUN apk add php7-zlib
RUN	apk add gettext
RUN apk add wget
RUN	rm -rf /var/cache/apk/*

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

EXPOSE 9000
