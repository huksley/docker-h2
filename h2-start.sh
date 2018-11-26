#!/bin/sh

cd /opt
env | grep H2

if [ ! -d ${H2DATA}/data ]; then
	sudo mkdir -p ${H2DATA}/data
	sudo chown -R h2 ${H2DATA}/data
fi

${H2DIR}/bin/h2.sh \
	-properties "${H2CONF}" \
	-baseDir "${H2DATA}/data" \
 	-web \
 	-webAllowOthers \
 	-webPort 8181 \
 	-tcp \
 	-tcpAllowOthers \
 	-tcpPort 1521
 	
#end