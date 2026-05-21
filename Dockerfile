FROM wordpress:6.5-apache
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf
RUN rm -f /etc/apache2/mods-enabled/mpm_*.load \
    && rm -f /etc/apache2/mods-enabled/mpm_*.conf \
    && a2enmod mpm_prefork
COPY ./wp-content /var/www/html/wp-content
RUN chown -R www-data:www-data /var/www/html/wp-content