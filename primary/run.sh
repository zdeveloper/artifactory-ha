source ../properties.sh

docker volume create $P_VOLUME

docker run -d \
	--name $P_CONTAINER \
	-e DB_TYPE=$DB_TYPE \
	-e DB_HOST=$DB_HOST \
	-e DB_PORT=$DB_PORT \
	-e DB_USER=$DB_USER \
	-e DB_PASSWORD=$DB_PASSWORD \
	-v $P_VOLUME:/var/opt/jfrog/artifactory \
	-p $P_PORT:8081 \
	--network=$NETWORK \
	$P_IMAGE

echo "sleeping for $SLEEP_TIME seconds"
sleep $SLEEP_TIME

command="curl -uadmin:password -X POST http://localhost:8081/artifactory/api/system/bootstrap_bundle"
docker exec -it $P_CONTAINER sh -c "$command"
docker cp $P_CONTAINER:/var/opt/jfrog/artifactory/etc/bootstrap.bundle.tar.gz ../secondary/bootstrap.bundle.tar.gz
