source ../properties.sh

S_VOLUME=$(docker volume create)

docker run -d \
	-e DB_TYPE=$DB_TYPE \
	-e DB_HOST=$DB_HOST \
	-e DB_PORT=$DB_PORT \
	-e DB_USER=$DB_USER \
	-e DB_PASSWORD=$DB_PASSWORD \
	-v $S_VOLUME:/var/opt/jfrog/artifactory \
	-p $S_PORT:8081 \
	--network=$NETWORK \
	$S_IMAGE
