FROM php:5-apache

MAINTAINER MaximeMisser <maxime.misser@epsi.fr>


RUN apt-get update && apt-get install -y \
    zip\
    curl \
    git \
    libcurl4-openssl-dev \
    libmcrypt-dev

EXPOSE 8080

COPY ./www/ /var/www/html

RUN docker-php-ext-install mysqli

RUN curl -sS https://getcomposer.org/download/1.7.2/composer.phar -o /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

RUN /usr/local/bin/composer require aws/aws-sdk-php


