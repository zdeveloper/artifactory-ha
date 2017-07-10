source ../properties.sh

if [ -z "$1" ]; then ID=1; else ID=$1; fi


S_VOLUME=$(docker volume create)

docker run -d \
	-v $S_VOLUME:/var/opt/jfrog/artifactory \
	-p $((8081 + $ID)):8081 \
	--network=$NETWORK \
	--restart=always \
	$S_IMAGE
