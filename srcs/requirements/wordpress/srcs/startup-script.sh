#because it's not working during the building phase of docker-compose
tar -xf wordpress-4.8.15.tar.gz
mv /wordpress/* /var/www/html/

# setting the credentials
envsubst '$MYSQL_DB_NAME $MYSQL_USER $MYSQL_USER_PASSWORD' < /tmp/wp-config.php > /var/www/html/wp-config.php

# starting the daemon
php-fpm7.3 --nodaemonize

# owo
#tail -f /dev/null
