FROM php:8.0-apache

# Install additional PHP extensions if needed
RUN docker-php-ext-install pdo pdo_mysql

RUN a2enmod ssl rewrite

# Copy your application code to the container
COPY . /var/www/html/

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html

# Ensure the web server runs as expected
EXPOSE 80

# Run Apache in the foreground
CMD ["apache2-foreground"]
