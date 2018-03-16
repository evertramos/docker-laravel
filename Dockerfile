# Dockerfile for Laravel

#FROM httpd:alpine
#FROM php:7.0-apache
#FROM php:7.1.3-apache
FROM php:7.2-apache

# Develop settings
RUN apt-get update && \
    apt-get install --no-install-recommends -y vim mysql-client git zip unzip

RUN echo "alias l='ls -la'" >> ~/.bashrc
RUN echo "alias a='php artisan'" >> ~/.bashrc

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Laravel App Requirements
RUN apt-get update && \
    apt-get install --no-install-recommends -y libfreetype6-dev libjpeg62-turbo-dev libgd-dev libxml2-dev openssl

RUN docker-php-ext-install tokenizer 
RUN docker-php-ext-install xml 
RUN docker-php-ext-install pdo_mysql 
RUN docker-php-ext-install mbstring 
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd 
RUN docker-php-ext-install dom 

RUN docker-php-source delete && \
    rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

