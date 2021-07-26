FROM alpine:3.14

RUN apk update \
	&& apk add nginx && mkdir -p /run/nginx \
	&& mkdir -p /var/www/my_server \
	&& apk add openssl \
	&& apk add openssh-server \
	&& rm -rf /var/cache/apk/*

# nginx config
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/my_server/

# ssl
RUN mkdir -p /etc/ssl/private/

COPY ./srcs/selfsigned-nginx.crt /etc/ssl/certs/
COPY ./srcs/selfsigned-nginx.key /etc/ssl/private/
COPY ./srcs/dhparam.pem /etc/ssl/certs/

COPY ./srcs/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY ./srcs/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

# CMD nginx && ash
CMD nginx -g 'daemon off;'

EXPOSE 80 443
