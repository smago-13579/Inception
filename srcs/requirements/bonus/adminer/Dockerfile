FROM debian:buster
LABEL maintainer="smago"

WORKDIR /var/www/adminer

RUN apt-get -y update && apt-get -y upgrade 
RUN	apt-get -y install php7.3 php7.3-mysql php7.3-fpm php-json php-xml wget
RUN wget http://www.adminer.org/latest.php -O /var/www/adminer/index.php

COPY ad_start.sh  /tmp/
RUN chmod +x /tmp/ad_start.sh
RUN mkdir -p /run/php/

RUN chown -R www-data:www-data /var/www/* && \
    chmod 755 -R /var/www/* 

EXPOSE 80

ENTRYPOINT [ "/tmp/ad_start.sh" ]
CMD [ "php-fpm7.3", "-F", "-R"]
