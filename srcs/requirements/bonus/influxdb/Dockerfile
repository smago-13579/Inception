FROM debian:buster
LABEL maintainer="smago"

RUN apt-get update && apt-get -y upgrade
RUN	apt-get -y install wget gnupg procps

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.8-amd64.deb && \
	dpkg -i influxdb2-2.0.8-amd64.deb

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf_1.20.2-1_amd64.deb && \
	dpkg -i telegraf_1.20.2-1_amd64.deb

RUN rm -rf influxdb2-2.0.8-amd64.deb telegraf_1.20.2-1_amd64.deb

COPY ./tools/start.sh /tmp
RUN chmod +x /tmp/start.sh

EXPOSE 8086

ENTRYPOINT [ "/tmp/start.sh" ]
CMD [ "influxd", "--bolt-path=/var/lib/influxdb/influxd.bolt", "--engine-path=/var/lib/influxdb/engine" ]
