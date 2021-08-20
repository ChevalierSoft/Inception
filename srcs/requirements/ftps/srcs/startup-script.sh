#!/bin/ash

# adding new user
adduser -D $FTPS_USER
echo "$FTPS_USER:$FTPS_USER_PASSWORD" | chpasswd &>/dev/null

# unset FTPS_USER_PASSWORD

echo "$FTPS_USER" > /etc/vsftpd/chroot.list

# setting up the logs
touch /var/log/vsftpd.log
tail -f /var/log/vsftpd.log &

# tail -f /dev/null

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf