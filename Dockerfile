FROM php:8.0-fpm-alpine3.16

LABEL Maintainer="team tvb-sz<nmg-sz@tvb.com>" Description="Nginx & PHP-FPM 8.0 based on Alpine Linux."

# Basic workdir
WORKDIR /srv

# Install php extension supervisor and nginx
RUN apk update && \
	apk add libpng libpng-dev gmp gmp-dev zlib zlib-dev oniguruma oniguruma-dev libjpeg-turbo-dev libpng-dev freetype-dev libzip libzip-dev libxslt libxslt-dev supervisor nginx bash && \
	docker-php-ext-configure gd --with-freetype --with-jpeg && \
	yes "" | pecl install redis && \
	yes "" | pecl install xlswriter && \
	docker-php-ext-install -j5 pcntl bcmath gd gmp mbstring mysqli pdo pdo_mysql opcache sockets xsl zip exif && \
    docker-php-ext-enable redis xlswriter && \
	rm -rf /var/cache/apk/* && \
	rm -rf /etc/nginx/sites-enabled/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
