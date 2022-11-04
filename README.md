# docker-laravel8-runtime

> Base on official php docker latest php fpm 8.0 adding needed extension and composer2, as well as nginx and supervisor are supported

# Image info

* Base: [php:8.0-fpm-alpine3.16](https://hub.docker.com/_/php/tags?page=1&name=8.0-fpm)
* Repo: [docker-laravel8-runtime](https://hub.docker.com/r/nmgsz/docker-laravel8-runtime)
* User: `www-data`

# ENV

* `php -m`

````
[PHP Modules]
bcmath
Core
ctype
curl
date
dom
exif
fileinfo
filter
ftp
gd
hash
iconv
json
libxml
mbstring
mysqli
mysqlnd
openssl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
redis
Reflection
session
SimpleXML
sockets
sodium
SPL
sqlite3
standard
tokenizer
xml
xmlreader
xmlwriter
Zend OPcache
zip
zlib

[Zend Modules]
Zend OPcache
````

* `php --ini`

````
Configuration File (php.ini) Path: /usr/local/etc/php
Loaded Configuration File:         (none)
Scan for additional .ini files in: /usr/local/etc/php/conf.d
Additional .ini files parsed:
/usr/local/etc/php/conf.d/docker-php-ext-gd.ini,
/usr/local/etc/php/conf.d/docker-php-ext-mysqli.ini,
/usr/local/etc/php/conf.d/docker-php-ext-opcache.ini,
/usr/local/etc/php/conf.d/docker-php-ext-pdo_mysql.ini,
/usr/local/etc/php/conf.d/docker-php-ext-redis.ini,
/usr/local/etc/php/conf.d/docker-php-ext-sockets.ini,
/usr/local/etc/php/conf.d/docker-php-ext-sodium.ini,
/usr/local/etc/php/conf.d/docker-php-ext-zip.ini
````

> none default `php.ini` file, you can copy your ini config at `/usr/local/etc/php/php.ini`

* php-fpm config

```
/usr/local/etc/
/usr/local/etc/php-fpm.conf
```

* `which nginx`

```
/usr/sbin/nginx
```

* nginx config
````
/etc/nginx
/etc/nginx/nginx.conf
````
