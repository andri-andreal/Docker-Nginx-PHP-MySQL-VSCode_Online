FROM php:7.2-fpm

MAINTAINER Andri Kurnia Putra <andri.24434@gmail.com>

RUN apt-get update && apt-get install -y \
        curl \
        wget \
        git \
        nano \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpq-dev \
        libzip-dev  \
        libicu-dev  \
        && docker-php-ext-install -j$(nproc) iconv mbstring mysqli pdo_mysql zip pdo_pgsql pgsql \
        && docker-php-ext-install -j$(nproc) gd

COPY symfony.pool.conf  /usr/local/etc/

# install php composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN usermod -u 1000 www-data

# install Application
#USER www-data
#WORKDIR /var/www/html
#RUN composer install

EXPOSE 9000
CMD ["php-fpm", "-F"]
