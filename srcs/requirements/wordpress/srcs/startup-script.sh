envsubst '$MYSQL_DB_NAME $MYSQL_USER $MYSQL_USER_PASSWORD' < /tmp/wp-config.php > /var/www/html/wp-config.php
#php-fpm7
#nginx -g 'daemon off;'
php-fpm7.3 --nodaemonize
#tail -f /dev/null
