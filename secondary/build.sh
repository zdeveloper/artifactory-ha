source ../properties.sh

if [ -z "$1" ]; then ID=1; else ID=$1; fi

cp ha-node ha-node.properties
#configure the node id
echo "node.id=secondary-node-$ID" >> ha-node.properties

echo building $S_IMAGE
docker build -t $S_IMAGE .

#delete generated config
rm ha-node.properties