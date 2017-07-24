#network
NETWORK=artifactory-network

#primary node
P_CONTAINER=artifactory-primary
P_IMAGE=artifactory-pro-ha-primary
P_PORT=8081
P_VOLUME=artifactory-data-primary
SLEEP_TIME=50 #seconds

#secondary node
S_CONTAINER=artifactory-secondary
S_IMAGE=artifactory-pro-ha-secondary

#DB info
DB_CONTAINER=postgres
DB_VOLUME=pgdata
DB_TYPE=postgresql
DB_HOST=$DB_CONTAINER
DB_NAME=artifactory
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD="VERY-STRONG-PASSWORD-HERE"
