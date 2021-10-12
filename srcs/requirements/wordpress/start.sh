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
	--url=3.14.144.26 \
	--title=${WORDPRESS_TITLE} \
	--admin_user=${WORDPRESS_ADM_USER} \
	--admin_password=${WORDPRESS_ADM_PASS} \
	--admin_email=smago@ya.ru
	wp-cli --allow-root user create ${WORDPRESS_SUBS} subs@ya.ru --user_pass=${WORDPRESS_SUBS_PASS} --role=subscriber
	wp-cli --allow-root user create ${WORDPRESS_AUTHOR} author@ya.ru --user_pass=${WORDPRESS_AUTHOR_PASS} --role=author
fi

exec "$@"