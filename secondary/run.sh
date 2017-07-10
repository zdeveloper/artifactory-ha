source ../properties.sh

S_VOLUME=$(docker volume create)

docker run -d \
	-v $S_VOLUME:/var/opt/jfrog/artifactory \
	-p $S_PORT:8081 \
	--network=$NETWORK \
	--restart=always \
	$S_IMAGE
