source ../properties.sh

#create the network
docker network create --driver bridge $NETWORK

#create the volume
docker volume create $DB_VOLUME

#run the image
docker run \
	--name $DB_CONTAINER \
	-e POSTGRES_DB=$DB_NAME \
	-e POSTGRES_USER=$DB_USER \
	-e POSTGRES_PASSWORD=$DB_PASSWORD \
	-v $DB_VOLUME:/var/lib/postgresql/data \
	-p $DB_PORT:5432 \
	--network=$NETWORK \
	-d postgres
