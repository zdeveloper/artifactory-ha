source ../properties.sh

cp ha-node ha-node.properties
#configure the node id
echo "node.id=secondary-node-$RANDOM" >> ha-node.properties

echo building $S_IMAGE
docker build -t $S_IMAGE .

#delete generated config
rm ha-node.properties