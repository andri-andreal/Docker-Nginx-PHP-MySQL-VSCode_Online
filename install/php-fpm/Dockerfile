FROM php:7.2-fpm

MAINTAINER Andri Kurnia Putra <andri.24434@gmail.com>

RUN apt-get update && \
    apt-get install -y \
    git \
    curl \
    nano \
    libfreetype6-dev \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    nano \
    libgmp-dev \
    libldap2-dev \
    netcat \
    sqlite3 \
    libsqlite3-dev && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-webp-dir=/usr/include/  --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd pdo pdo_mysql pdo_sqlite zip gmp bcmath pcntl ldap sysvmsg exif
        

COPY symfony.pool.conf  /usr/local/etc/

# install php composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN usermod -u 1000 www-data

RUN echo "Asia/Jakarta" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# install Application
#USER www-data
#WORKDIR /var/www/html
#RUN composer install

EXPOSE 9000
CMD ["php-fpm", "-F"]
