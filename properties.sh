HOME_DIR=$(pwd)
SLEEP_TIME=30
#PRIMARY NODE
P_CONTAINER=artifactory-primary
P_IMAGE=artifactory-pro-ha-primary
P_PORT=8081
P_VOLUME=artifactory-data-primary
#SECONDARY NODE
S_CONTAINER=artifactory-secondary
S_IMAGE=artifactory-pro-ha-secondary
S_PORT=8082
S_NODE_ID=1
#DB info
DB_CONTAINER=postgres
DB_VOLUME=pgdata
DB_TYPE=postgresql
DB_HOST=$DB_CONTAINER
DB_NAME=artifactory
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD="VERY-STRONG-PASSWORD-HERE"

NETWORK=artifactory-network
