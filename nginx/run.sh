source ../properties.sh

docker rm -f $NGINX_CONTAINER | true

docker run \
	--name $NGINX_CONTAINER \
	-p $NGINX_PORT_HTTP:80 \
	-p $NGINX_PORT_HTTPS:443 \
	-p 5550-5560:5550-5560 \
	--network=$NETWORK \
	--restart=always \
	-d nginx


docker cp nginx.conf $NGINX_CONTAINER:/etc/nginx/nginx.conf
docker cp server-key.pem $NGINX_CONTAINER:/etc/nginx/server-key.pem
docker cp server-crt.pem $NGINX_CONTAINER:/etc/nginx/server-crt.pem
docker exec -it $NGINX_CONTAINER sh -c "/etc/init.d/nginx reload"
docker cp nginx.conf $NGINX_CONTAINER:/etc/nginx/nginx.conf
docker logs $NGINX_CONTAINER
