FROM debian:buster
LABEL maintainer="smago"

RUN apt-get update && apt-get -y upgrade
RUN	apt-get -y install nginx \
	openssl

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN openssl req -newkey rsa:2048 -subj "/C=RU/ST=MO/L=Moscow/O=School21/OU=IT/CN=smago" -x509 -nodes -days 365 \
	-keyout /etc/ssl/domain.key -out /etc/ssl/domain.crt 

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]