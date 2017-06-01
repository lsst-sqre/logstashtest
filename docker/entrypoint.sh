#!/bin/bash
function set_config() {
    KEY=$1
    VALUE=$2
    FILE=$3
    if [ -z "${VALUE}" ]; then
        echo "${KEY} must be set" 1>&2
        exit 1
    fi
    sed -i "s/{{${KEY}}}/${VALUE}/g" ${FILE}
}

function log_timestamp() {
    while : ; do
	sleep 10
	date >> /var/log/timestamp.log
    done
}

log_timestamp &
FB=/etc/filebeat/filebeat.yml
set_config LOGSTASH_HOST ${LOGSTASH_HOST} ${FB}
set_config LOGSTASH_PORT ${LOGSTASH_PORT} ${FB}
exec /usr/share/filebeat/bin/filebeat -c ${FB} -e \
     -path.home /usr/share/filebeat -path.config /etc/filebeat \
     -path.data /var/lib/filebeat -path.logs /var/log/filebeat -d \*
