FROM php:8.0-fpm-alpine3.16

LABEL Maintainer="team tvb-sz<nmg-sz@tvb.com>" Description="Nginx & PHP-FPM 8.0 based on Alpine Linux."

ARG TARGETOS
ARG TARGETARCH

# Install php extension
COPY install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions bcmath exif gd opcache mysqli pdo_mysql redis-^5.3 sockets zip && \
    install-php-extensions @composer-2 # install composer2 latest

# Install software
RUN apk update && \
	apk add --no-cache supervisor nginx && \
	rm -rf /var/cache/apk/* && \
	rm -rf /etc/nginx/sites-enabled/*
