FROM docker.io/library/nginx:1.27-alpine

LABEL app="proyectos-web" version="casopractico2"

COPY html/ /seed-html/

COPY seed-entrypoint.sh /seed-entrypoint.sh
RUN chmod +x /seed-entrypoint.sh

EXPOSE 80
