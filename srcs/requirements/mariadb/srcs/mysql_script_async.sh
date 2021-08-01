#! /bin/ash

# wait the daemon
until mysql -e "SELECT now();" 2> /dev/null
do
    sleep 1
done

# translate every $var into their values
envsubst < /tmp/mysql.sql > tmp/mysql_ready.sql

# import db setup
mysql -u root < /tmp/mysql_ready.sql
mysql -u root wordpress < /tmp/new_super_mario_sql.sql
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';"

# no need for them anymore...
#unset MYSQL_USER_PASSWD MYSQL_ADMIN_PASSWORD
rm -f /tmp/mysql_ready.sql /tmp/mysql.sql
rm -f /tmp/dump.sql
rm -f /mysql_script_async.sh /mysql_script.sh

tail -f /var/lib/mysql/mysql_log.log &
tail -f /var/lib/mysql/mysql_log.err &
