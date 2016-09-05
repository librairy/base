#!/usr/bin/env bash

/var/lib/neo4j/bin/neo4j-shell -c < /tmp/grapdb-constraints.cql

while : ;do
  sleep 5;
  echo "=======> checking neo4j status"
  # Get the status of this machine from the Cassandra nodetool
  #STATUS=`nodetool status | grep 'UN' | awk '{print $1}'`
  STATUS=`/var/lib/neo4j/bin/neo4j-shell -c "schema" | tail -1`
  # Once the status is Up and Normal, then we are ready
  if [ "$STATUS" = "No constraints" ]; then
        echo "===================================================="
        echo "loading constraints"
        echo "===================================================="
        /var/lib/neo4j/bin/neo4j-shell -file /tmp/graphdb-constraints.cql
        echo "===================================================="
        echo "librairy constraints loaded successfully"
        echo "===================================================="
        break
  fi

done
