FROM wordpress:latest

COPY ./wp-content /var/www/html/wp-content
RUN chown -R www-data:www-data /var/www/html/wp-content

CMD bash -c "\
  a2dismod mpm_event mpm_worker 2>/dev/null || true && \
  a2enmod mpm_prefork 2>/dev/null || true && \
  sed -i \"s/80/$PORT/g\" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf && \
  exec docker-entrypoint.sh apache2-foreground"
