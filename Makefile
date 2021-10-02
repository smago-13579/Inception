DC 	= 	docker-compose
DC_CONFIG = ./srcs/docker-compose.yml

ALL = nginx mariadb wordpress

DATABASE_V = /home/smago/data/database
WORDPRESS_V = /home/smago/data/wordpress


all: 
	sudo mkdir -p ${WORDPRESS_V} ${DATABASE_V}
	${DC} -f ${DC_CONFIG} build
	${DC} -f ${DC_CONFIG} up -d ${ALL}


clean: 
	sudo rm -rf ${WORDPRESS_V} ${DATABASE_V}
	${DC} -f ${DC_CONFIG} down

