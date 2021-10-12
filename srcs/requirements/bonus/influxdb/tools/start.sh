#!/bin/bash


if [ ! -f /root/.influxdbv2/configs ]; then 

	service influxdb start
	
	echo "Creating influxdb"

	sleep 20
	influx setup --bucket Inception -t Mytoken -o ${ORG} \
		--username=${INFLUX_USER} --password=${INFLUX_PASS} \
		--host=http://localhost:8086 -f

	echo "127.0.0.1 smago.42.fr" >> /etc/hosts
	echo "User created!!!"

fi

service influxdb stop

exec $@

