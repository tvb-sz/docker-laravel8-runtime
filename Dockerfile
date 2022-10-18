FROM php:8.0-fpm-alpine3.15

LABEL Maintainer="team tvb-sz<nmg-sz@tvb.com>" Description="Nginx & PHP-FPM 8.0 based on Alpine Linux."

# Install software
RUN apk update && \
	apk add --no-cache libpng libpng-dev zlib zlib-dev oniguruma oniguruma-dev libjpeg-turbo-dev libpng-dev freetype-dev libzip libzip-dev supervisor nginx && \
	docker-php-ext-configure gd --with-freetype --with-jpeg && \
	yes "" | pecl install redis && \
	docker-php-ext-install -j5 gd mbstring mysqli pdo pdo_mysql opcache sockets zip && \
    docker-php-ext-enable redis && \
    apk del --no-network libpng libpng-dev zlib zlib-dev oniguruma oniguruma-dev libjpeg-turbo-dev libpng-dev freetype-dev libzip libzip-dev && \
	rm -rf /var/cache/apk/* && \
	rm -rf /etc/nginx/sites-enabled/*
