#!/bin/bash


if [ ! -f /tmp/sql_reset ]; then 
	
	echo "create database"

	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	touch /tmp/sql_reset

	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${DATABASE_RPASS}';" >> /tmp/sql_reset
	echo "SET PASSWORD FOR 'root'@'%' = PASSWORD('${DATABASE_RPASS}');" >> /tmp/sql_reset
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DATABASE_RPASS}');" >> /tmp/sql_reset
	echo "DROP DATABASE IF EXISTS test;" >> /tmp/sql_reset
	echo "CREATE DATABASE IF NOT EXISTS wordpress;" >> /tmp/sql_reset
	echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_UPASS}';" >> /tmp/sql_reset
	echo "FLUSH PRIVILEGES;" >> /tmp/sql_reset
	echo "all done!!!"

fi


exec $@
