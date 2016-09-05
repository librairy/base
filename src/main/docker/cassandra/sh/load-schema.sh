#!/usr/bin/env bash

for i in {1..15}
do
  sleep 5;
  echo "checking cassandra status"
  # Get the status of this machine from the Cassandra nodetool
  #STATUS=`nodetool status | grep 'UN' | awk '{print $1}'`
  STATUS=`nodetool statusthrift`
  # Once the status is Up and Normal, then we are ready
  #if [ $STATUS = "UN" ]; then
  if [ "$STATUS" = "running" ]; then
        echo "loading librairy schema .."
        cqlsh -f /tmp/librairy-schema.cql
        echo "librairy schema loaded"
        break
  fi

done
