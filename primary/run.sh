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
	$P_IMAGE

#sleep for 20 seconds
sleep 20
command="curl -uadmin:password -X POST http://localhost:8081/artifactory/api/system/bootstrap_bundle"
docker exec -i $P_CONTAINER sh -c "$command"
docker cp $P_CONTAINER:/var/opt/jfrog/artifactory/etc/bootstrap_bundle.tar.gz .
