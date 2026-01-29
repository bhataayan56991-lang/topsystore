FROM php:8.2-apache

RUN apt-get update && apt-get install -y unzip git

COPY . /var/www/html

RUN unzip laravel.zip -d /var/www/html && rm laravel.zip

WORKDIR /var/www/html/laravel

RUN docker-php-ext-install pdo pdo_mysql

RUN sed -i 's|/var/www/html|/var/www/html/laravel/public|g' /etc/apache2/sites-available/000-default.conf

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
