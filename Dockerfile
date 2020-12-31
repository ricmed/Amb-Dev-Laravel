FROM php:7.3.6-fpm-alpine3.9
RUN apk add --no-cache shadow
RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www
RUN rm -rf /var/www/html


RUN chown -R www-data:www-data /var/www
RUN ln -s public html
RUN usermod -u 1000 www-data




# Instala o composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

USER www-data


EXPOSE 9000
ENTRYPOINT ["php-fpm"]
