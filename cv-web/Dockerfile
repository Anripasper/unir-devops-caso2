FROM docker.io/library/nginx:1.27-alpine

LABEL app="cv-web" version="casopractico2"

COPY html/ /usr/share/nginx/html/
#  Certificado x.509 autofirmado
COPY ssl/server.crt /etc/nginx/ssl/server.crt
COPY ssl/server.key /etc/nginx/ssl/server.key
# Basic Auth
COPY auth/.htpasswd /etc/nginx/.htpasswd
# Configuración de Nginx con HTTPS + auth
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443
