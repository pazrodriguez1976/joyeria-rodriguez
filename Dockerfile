FROM wordpress:6.5-apache

RUN rm -f /etc/apache2/mods-enabled/mpm_*.load \
    && rm -f /etc/apache2/mods-enabled/mpm_*.conf \
    && a2enmod mpm_prefork

COPY ./wp-content /var/www/html/wp-content
RUN chown -R www-data:www-data /var/www/html/wp-content

COPY docker-entrypoint-railway.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint-railway.sh

ENTRYPOINT ["docker-entrypoint-railway.sh"]
CMD ["apache2-foreground"]