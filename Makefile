DC 	= 	docker-compose
DC_CONFIG = ./srcs/docker-compose.yml

ALL = nginx mariadb wordpress adminer influxdb

DATA = /home/smago/data
DATABASE_V = /home/smago/data/database
WORDPRESS_V = /home/smago/data/wordpress
ADMINER_V = /home/smago/data/adminer


all: 
	sudo mkdir -p ${DATA} 
	sudo mkdir -p ${WORDPRESS_V} ${DATABASE_V} ${ADMINER_V}
	${DC} -f ${DC_CONFIG} build
	${DC} -f ${DC_CONFIG} up -d ${ALL}

start:
	${DC} -f ${DC_CONFIG} start

stop:
	${DC} -f ${DC_CONFIG} stop

clean: 
	sudo rm -rf ${DATA}
	${DC} -f ${DC_CONFIG} down

re: clean all

.PHONY: all start stop clean re
