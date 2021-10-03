FROM debian:buster
LABEL maintainer="smago"

RUN apt-get update && apt-get -y upgrade
RUN	apt-get -y install mariadb-client php7.3 \
	php7.3-mysql php7.3-fpm php-json php-xml wget

RUN mkdir -p /var/www
RUN chown -R www-data:www-data /var/www && chmod 775 -R /var/www

COPY start.sh /tmp
RUN chmod +x /tmp/start.sh
RUN mkdir -p run/php

EXPOSE 9000

ENTRYPOINT [ "/tmp/start.sh" ]
CMD [ "php-fpm7.3", "-F", "-R"]
