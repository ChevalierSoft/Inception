# commands to start nginx server

- `docker build . -t wordpress`
- `docker run -di --rm -p 80:80 -p 443:443 --name wordpress_c wordpress`

## generate ssl key
`openssl req -x509 -nodes -days 999 -newkey rsa:4096 -keyout ssl.key -out ssl.crt`

`openssl dhparam -out /etc/ssl/certs/dhparam.pem 4096`
