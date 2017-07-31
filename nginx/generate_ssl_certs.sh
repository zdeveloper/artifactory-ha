source ../properties.sh
set -x

sudo openssl genrsa -des3 -passout pass:x -out server.pass.key 2048

sudo openssl rsa -passin pass:x -in server.pass.key -out server.key

sudo rm server.pass.key


cat > ssl.conf  <<-EOF
[req]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn
 
[ dn ]
C = $SSL_C
ST = $SSL_ST
L = $SSL_L
O = $SSL_O
OU = $SSL_OU
emailAddress = $SSL_EMAIL
CN = $SSL_CN
 
[ req_ext ]
subjectAltName = @alt_names
 
[ alt_names ]
DNS.1 = $NET_IP
EOF

sudo openssl req -new \
	-config ssl.conf \
	-key server.key	\
	-out server.csr

sudo openssl x509 -req -sha256 -days $SSL_DAYS -in server.csr -signkey server.key -out server.pem

#copy over the keys to files
cp server.pem ../primary/server.pem
cp server.pem ../secondary/server.pem
