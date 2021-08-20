FROM alpine

ENV FTPS_USER "dait-atm"
ENV FTPS_USER_PASSWORD "catJam"

RUN apk update \
    && apk add vsftpd gettext \
    && rm -rf /var/cache/apk/*

COPY srcs/self-signed.crt /etc/ssl/certs/
COPY srcs/self-signed.key /etc/ssl/private/

COPY srcs/vsftpd.conf /etc/vsftpd/

COPY srcs/startup-script.sh /tmp/

# CMD tail -f /dev/null

CMD /tmp/startup-script.sh

EXPOSE 20 21 30000 30001
