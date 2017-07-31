source ../properties.sh
set -x

sudo openssl genrsa -des3 -passout pass:x -out server.pass.key 2048

sudo openssl rsa -passin pass:x -in server.pass.key -out server.key

sudo rm server.pass.key

echo "\nSKIP -> challenge password []:]]\n"
sudo openssl req -new \
	-subj "/C=$SSL_C/ST=$SSL_ST/L=$SSL_L/O=$SSL_O/OU=$SSL_OU/CN=$SSL_CN/emailAddress=$SSL_EMAIL" \
	-key server.key	\
	-out server.csr \
	-ext SAN=$NET_IP

sudo openssl x509 -req -sha256 -days $SSL_DAYS -in server.csr -signkey server.key -out server.pem

#copy over the keys to files
cp server.pem ../primary/server.pem
cp server.pem ../secondary/server.pem
