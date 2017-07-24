sudo openssl genrsa -des3 -passout pass:x -out server.pass.key 2048

sudo openssl rsa -passin pass:x -in server.pass.key -out server.key

sudo rm server.pass.key

echo "\nSKIP -> challenge password []:]]\n"
sudo openssl req -new -key server.key -out server.csr

sudo openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt