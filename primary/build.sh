source ../properties.sh

echo building $P_IMAGE
docker build -t $P_IMAGE .
