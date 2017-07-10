# Artifactory HA

The easy way to deploy Artifactory HA (multi-node) via docker. This repo make it easier to deploy a postgres db and the primary ha artifactory node and automatically connect the two with correct ha config. it also makes it possible to spin as many secondary nodes as you want to really put the high availability in HA

# Requirements
A newer Docker version that supports docker network.

# installation
run the ``` deploy ``` script to run the containers
the ```properties.sh``` contains every configuration you might wish to change

# postgres config
the postgres config is in the ```properties.sh```, make sure to atleast change your password.

```bash
# DB info
DB_CONTAINER=postgres
DB_VOLUME=pgdata
DB_TYPE=postgresql
DB_HOST=$DB_CONTAINER
DB_NAME=artifactory
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD="VERY-STRONG-PASSWORD-HERE"
```
