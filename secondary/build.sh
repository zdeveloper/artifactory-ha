source ../properties.sh

echo building $S_IMAGE
docker build -t $S_IMAGE .
