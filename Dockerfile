FROM php:8.0-apache

# Install additional PHP extensions if needed
RUN docker-php-ext-install pdo pdo_mysql

# Copy your application code to the container
COPY ./web/* /var/www/html/

COPY black-devil.click.conf /etc/apache2/sites-available/black-devil.click.conf

RUN a2enmod ssl rewrite

WORKDIR /var/www/html

# Ensure the web server runs as expected
EXPOSE 80

# Run Apache in the foreground
CMD ["apache2-foreground"]
