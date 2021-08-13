# nginx Dockerfile

FROM debian:buster

RUN apt-get update
RUN	apt-get install -y nginx curl
#RUN mkdir -p /var/www/my_server
RUN rm -rf /var/cache/apk/*

# preparing directories for wordpress
RUN mkdir -p /var/www/wordpress
RUN chown -R  www-data:www-data /var/www/wordpress/
RUN chmod 777 /var/www/wordpress/
#  if using alpine
#RUN mkdir -p /run/nginx

# nginx config
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./conf/index.html .

# ssl
RUN mkdir -p /etc/ssl/private/
RUN mkdir -p /etc/ssl/certs/

COPY ./conf/selfsigned-nginx.crt /etc/ssl/certs/
COPY ./conf/selfsigned-nginx.key /etc/ssl/private/
COPY ./conf/dhparam.pem /etc/ssl/certs/

COPY ./conf/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY ./conf/ssl-params.conf /etc/nginx/snippets/ssl-params.conf

WORKDIR /var/www/wordpress

ENTRYPOINT cp /index.html /var/www/wordpress && nginx -g 'daemon off;'

EXPOSE 443
