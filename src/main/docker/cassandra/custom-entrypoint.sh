#!/bin/bash
#
# Run Tomcat
set -e

#/usr/local/apache-tomcat-7.0.30/bin/catalina.sh start

load-schema.sh &

/docker-entrypoint.sh "$@"