#! /bin/ash

# setup mariadb HERE and not in the docker file BECAUSE !
service mariadb setup

# enance the config file of mariadb
cat /tmp/mariadb-server-enanced.cnf >> /etc/my.cnf.d/mariadb-server.cnf

# that way other services can talk to mysql outside localhost
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

# setup mysql and databases in a nohup after the daemon and display logs
nohup /mysql_script_async.sh &
tail -f nohup.out & #2>&1 | cat > /dev/null &

# start mysql daemon
/usr/bin/mysqld_safe --datadir='/var/lib/mysql/'

