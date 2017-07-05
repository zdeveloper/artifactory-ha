source ../properties.sh
docker volume create $DB_VOLUME

docker run \
	--name $DB_CONTAINER \
	-e POSTGRES_DB=$DB_NAME \
	-e POSTGRES_USER=$DB_USER \
	-e POSTGRES_PASSWORD=$DB_PASSWORD \
	-v $DB_VOLUME:/var/lib/postgresql/data \
	-p $DB_PORT:5432 \
	-d postgres
