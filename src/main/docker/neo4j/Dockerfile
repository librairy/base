FROM neo4j:2.3.1
MAINTAINER Librairy <librairy.framework@gmail.com>

ADD conf/ /conf

ENV NEO4J_HEAP_MEMORY 4096
ENV NEO4J_CACHE_MEMORY 2G
ENV NEO4J_AUTH none

COPY cql/*.cql /tmp/

COPY sh/*.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

COPY custom-entrypoint.sh /custom-entrypoint.sh
ENTRYPOINT ["/custom-entrypoint.sh"]

EXPOSE 7474 7473

CMD ["neo4j"]