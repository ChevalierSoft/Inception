FROM alpine:3.14

RUN apk update \
	&& apk add nginx && mkdir -p /run/nginx \
	&& mkdir -p /var/www/my_server \
	&& apk add openssl \
	&& apk add openssh-server \
	&& rm -rf /var/cache/apk/*

# nginx config
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./conf/index.html /var/www/my_server/

# ssl
RUN mkdir -p /etc/ssl/private/

COPY ./conf/selfsigned-nginx.crt /etc/ssl/certs/
COPY ./conf/selfsigned-nginx.key /etc/ssl/private/
COPY ./conf/dhparam.pem /etc/ssl/certs/

COPY ./conf/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY ./conf/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

# CMD nginx && ash
CMD nginx -g 'daemon off;'

EXPOSE 80 443
