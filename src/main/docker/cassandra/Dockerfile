FROM cassandra:2.2.4
MAINTAINER Librairy <librairy.framework@gmail.com>

ENV CASSANDRA_START_RPC true
ENV CATALINA_HOME /usr/local/apache-tomcat-7.0.30
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p -m 777 "$CATALINA_HOME"
WORKDIR /usr/local

#RUN apt-get update \
#	&& apt-get install -y netcat

#ENV HELENOS_URL http://freefr.dl.sourceforge.net/project/helenos-gui/Bundles/helenos-1.5-tomcat7_bundle.zip

#RUN set -x \
#	&& curl -fSL "$HELENOS_URL" -o helenos.zip \
#	&& unzip helenos.zip \
#	&& rm helenos.zip \
#	&& chmod -R 777 $CATALINA_HOME

COPY cql/*.cql /tmp/

COPY sh/*.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

COPY limits.conf /limits.conf
RUN cat /limits.conf | tee -a /etc/security/limits.conf

COPY settings.conf /settings.conf
RUN cat /settings.conf | tee -a /etc/sysctl.conf

RUN sed "s/cassandra  -  nproc    10000/cassandra  -  nproc    32768/g" /etc/security/limits.d/cassandra.conf

COPY custom-entrypoint.sh /custom-entrypoint.sh
ENTRYPOINT ["/custom-entrypoint.sh"]

EXPOSE 7000 7001 7199 8080 9042 9160
CMD ["cassandra","-f"]