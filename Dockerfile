FROM php:8.0-fpm-alpine3.15

LABEL Maintainer="team tvb-sz<nmg-sz@tvb.com>" Description="Nginx & PHP-FPM 8.0 based on Alpine Linux."

# Basic workdir
WORKDIR /srv

# Install php extension supervisor and nginx
RUN apk update && \
	apk add libpng libpng-dev zlib zlib-dev oniguruma oniguruma-dev libjpeg-turbo-dev libpng-dev freetype-dev libzip libzip-dev supervisor nginx bash && \
	docker-php-ext-configure gd --with-freetype --with-jpeg && \
	yes "" | pecl install redis && \
	docker-php-ext-install -j5 gd mbstring mysqli pdo pdo_mysql opcache sockets zip bcmath exif && \
    docker-php-ext-enable redis && \
	rm -rf /var/cache/apk/* && \
	rm -rf /etc/nginx/sites-enabled/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
