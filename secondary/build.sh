source ../properties.sh

cp ha-node ha-node.properties
#configure the context url
echo "context.url=http://$P_IP:$P_PORT/artifactory" >> ha-node.properties

echo building $S_IMAGE
docker build -t $S_IMAGE .

#delete generated config
rm ha-node.properties
