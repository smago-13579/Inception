FROM debian:buster
LABEL maintainer="smago"

RUN apt-get update && apt-get -y upgrade
RUN	apt-get -y install mariadb-server && \
	mkdir -p /run/mysqld && \
	chown -R mysql /run/mysqld && \
	chown -R mysql /var/lib/mysql

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/db_start.sh /tmp
RUN chmod +x /tmp/db_start.sh

EXPOSE 3306

ENTRYPOINT [ "/tmp/db_start.sh" ]

CMD [ "mysqld" , "--init-file=/tmp/sql_reset" ]
