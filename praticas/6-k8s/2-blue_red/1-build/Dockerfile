FROM alpine:3.7

ARG app

RUN apk --update --no-cache add nginx php5-fpm && \
    mkdir -p /run/nginx

COPY index-${app}.php www/index.php
ADD nginx.conf /etc/nginx/
ADD php-fpm.conf /etc/php5/php-fpm.conf

EXPOSE 80
CMD php-fpm5 -d variables_order="EGPCS" && exec nginx -g "daemon off;"
