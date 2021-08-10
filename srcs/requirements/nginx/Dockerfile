FROM debian:buster

#FROM alpine:3.14

RUN apt-get update
RUN	apt-get install -y nginx curl
RUN mkdir -p /run/nginx
RUN mkdir -p /var/www/my_server
#RUN apt-get insatll openssl
#RUN apt-get insatll openssh-server -y
RUN rm -rf /var/cache/apk/*

# nginx config
#RUN rm -f /etc/nginx/conf.d/default.conf
#COPY ./conf/nginx.conf /etc/nginx/sites-available/dait-atm.fr.conf
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./conf/index.html /var/www/my_server/

# ssl
RUN mkdir -p /etc/ssl/private/
RUN mkdir -p /etc/ssl/certs/

COPY ./conf/selfsigned-nginx.crt /etc/ssl/certs/
COPY ./conf/selfsigned-nginx.key /etc/ssl/private/
COPY ./conf/dhparam.pem /etc/ssl/certs/

COPY ./conf/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY ./conf/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

# CMD nginx && ash
CMD nginx -g 'daemon off;'

EXPOSE 443
