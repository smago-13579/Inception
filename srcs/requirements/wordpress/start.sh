#!/bin/bash
set -e

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"

if [ ! -d /var/www/wordpress/wp-content ]; then
	echo "Configuring wordpress..."
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/bin/wp-cli
	cd /var/www/wordpress
	wp-cli core download --allow-root 
	wp-cli core config --allow-root --dbname=wordpress --dbuser=$DATABASE_USER --dbpass=$DATABASE_UPASS --dbhost=mariadb
	wp-cli core install --allow-root \
	--url=${WORDPRESS_URL} \
	--title=${WORDPRESS_TITLE} \
	--admin_user=${WORDPRESS_ADMIN_USER} \
	--admin_password=${WORDPRESS_ADMIN_PASS} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL}
	wp-cli user create --allow-root smago smago@student.21-school.ru --user_pass=smago123
fi

exec "$@"