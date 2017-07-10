source ../properties.sh

if [ -z "$1" ]; then ID=1; else ID=$1; fi


S_VOLUME=$(docker volume create)

cp ha-node ha-node.properties
#configure the node id
echo "node.id=secondary-node-$ID" >> ha-node.properties

CONTAINER="$S_CONTAINER-$ID"
docker run -d \
	--name $CONTAINER \
	-v $S_VOLUME:/var/opt/jfrog/artifactory \
	-p $((8081 + $ID)):8081 \
	--network=$NETWORK \
	--restart=always \
	$S_IMAGE

#delete generated config
docker cp ha-node.properties $CONTAINER:/var/opt/jfrog/artifactory/etc/ha-node.properties
rm ha-node.properties