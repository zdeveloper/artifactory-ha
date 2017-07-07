source ../properties.sh

cp ha-node ha-node.properties
#configure the context url
echo "context.url=http://127.0.0.1:$P_PORT/artifactory" >> ha-node.properties

echo building $P_IMAGE
docker build -t $P_IMAGE .

#delete generated config
rm ha-node.properties
