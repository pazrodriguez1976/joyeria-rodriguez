FROM wordpress:php8.2-apache
RUN a2dismod mpm_event mpm_worker || true
RUN a2enmod mpm_prefork || true
COPY ./wp-content /var/www/html/wp-content
RUN chown -R www-data:www-data /var/www/html/wp-content