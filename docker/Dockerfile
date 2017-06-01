FROM centos:7
MAINTAINER sqre-admin
LABEL description="Logstash tester for rmq shovel" \
      name="lsstsqre/logstashtest"
RUN yum -y update
ARG FBV="5.4.0"
RUN yum -y install \
https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$FBV-x86_64.rpm
COPY entrypoint.sh /
RUN  chmod 0755 /entrypoint.sh
COPY filebeat.yml /etc/filebeat/
ENTRYPOINT [ "/entrypoint.sh" ]
