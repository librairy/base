#!/usr/bin/env bash

for i in {1..15}
do
  sleep 5;
  echo "checking neo4j status"
  STATUS=`/var/lib/neo4j/bin/neo4j-shell -c "schema" | tail -1`
  # Once the status is Up and Normal, then we are ready
  if [ "$STATUS" = "No constraints" ]; then
        echo "loading node and relation constraints .."
        /var/lib/neo4j/bin/neo4j-shell -file /tmp/graphdb-constraints.cql
        echo "librairy constraints loaded"
        break
  fi

done
