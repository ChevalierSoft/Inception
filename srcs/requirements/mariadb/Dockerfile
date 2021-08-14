### mysql container
FROM alpine:latest

RUN apk update
RUN apk add mariadb
RUN apk add mariadb-client
RUN apk add mysql mysql-client
RUN apk add openrc
RUN apk add gettext
RUN apk add vim
RUN rm -rf /var/cache/apk/*

# seting up openrc
RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel

# setting up mariadb with openrc
# IN THE SETUP.sh OR IT WILL NOT WORK !
#  (service mariadb setup)

COPY srcs/mysql_script.sh /
COPY srcs/mysql_script_async.sh /
# COPY srcs/dump.sql /tmp
COPY srcs/new_super_mario_sql.sql /tmp
COPY srcs/mysql.sql /tmp
COPY srcs/mariadb-server-enanced.cnf /tmp/mariadb-server-enanced.cnf

ENTRYPOINT ["/mysql_script.sh"]

EXPOSE 3306
