#!/bin/bash
set -e

PORT=${PORT:-80}
sed -i "s/80/$PORT/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

exec docker-entrypoint.sh "$@"