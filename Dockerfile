FROM php:8.0-fpm-alpine3.16

LABEL Maintainer="team tvb-sz<nmg-sz@tvb.com>" Description="Nginx & PHP-FPM 8.0 based on Alpine Linux."

# Basic workdir
WORKDIR /srv

    # ① install lib and software
RUN apk update && \
    apk add libpng libpng-dev \
    gmp gmp-dev \
    zlib zlib-dev \
    oniguruma oniguruma-dev \
    libjpeg-turbo-dev libpng-dev \
    freetype-dev libzip libzip-dev \
    libxslt libxslt-dev \
    libxpm libxpm-dev \
    libvpx libvpx-dev \
    libwebp libwebp-dev \
    linux-headers \
    supervisor nginx bash && \
    # ② configure and install pecl extension
    docker-php-ext-configure gd --with-freetype=/usr/lib/ --with-jpeg=/usr/lib/ --with-xpm --with-webp && \
    yes "" | pecl install redis && \
    yes "" | pecl install xlswriter && \
    # ③ install built-in extension and enable some ext extension
    docker-php-ext-install -j5 pcntl bcmath gd gmp mbstring mysqli pdo pdo_mysql opcache sockets xsl zip exif && \
    docker-php-ext-enable redis xlswriter && \
    rm -rf /var/cache/apk/* && \
    rm -rf /etc/nginx/sites-enabled/* && \
    # ④ install composer2
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
