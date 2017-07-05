P_IP=172.17.0.1
#PRIMARY NODE
P_CONTAINER=artifactory-primary
P_IMAGE=artifactory-pro-ha-primary
P_PORT=8081
P_VOLUME=artifactory-data-primary
#SECONDARY NODE
S_IMAGE=artifactory-pro-ha-secondary
S_PORT=8082
#DB info
DB_CONTAINER=postgres
DB_VOLUME=pgdata
DB_TYPE=postgresql
DB_HOST=172.17.0.1
DB_NAME=artifactory
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD="VERY-STRONG-PASSWORD-HERE"
