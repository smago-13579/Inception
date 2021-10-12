#!/bin/bash
set -e

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 80/" "/etc/php/7.3/fpm/pool.d/www.conf"

exec "$@"