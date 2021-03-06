# Librairy Base

## Get Started!

The only prerequisite to consider is to have installed [Docker-Compose v2](https://docs.docker.com/compose/) in your system.

Once it is installed, create a file named `base/docker-compose.yml` containing the following services:

```yml
version: "2"
services:
 column-db:
   container_name: column-db
   image: librairy/column-db:1.0
   restart: always
   expose:
     - "9042"
     - "9160"
   ports:
     - "5010:8080"
     - "5011:9042"
     - "5012:9160"
   networks:
     - "db"
 document-db:
   container_name: document-db
   image: librairy/document-db:1.0
   restart: always
   expose:
     - "9200"
     - "9300"
   ports:
     - "5020:9200"
     - "5021:9300"
   networks:
     - "db"
 graph-db:
   container_name: graph-db
   image: librairy/graph-db:1.0
   restart: always
   expose:
     - "7474"
   ports:
     - "5030:7474"
   networks:
     - "db"
 event-bus:
   container_name: event-bus
   image: librairy/event-bus:1.0
   restart: always
   expose:
     - "15672"
     - "5672"
   ports:
     - "5040:15672"
     - "5041:5672"
   networks:
     - "events"

networks:
 db:
 events:
```
and then, deploy it by typing:

```sh
$ docker-compose up
```

That's all!! **librairy base** should be run in your system now.

Verify that it works on: [http://localhost:5030](http://localhost:5030).

Note that by using Docker from OS X, the host address is not `localhost`. See [here](https://docs.docker.com/engine/installation/mac/) for more details.

Remember that by using the flags: `-d`  you can deploy it in background mode as a domain service. Also, it can be useful to include : `restart: "always"` in every service definition.