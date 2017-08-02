sudo rm ~/.rnd

source ../properties.sh
set -x

cat > server.cnf  <<-EOF
[req]
default_bits           = 4096
days                   = 9999
distinguished_name     = req_distinguished_name
attributes             = req_attributes
prompt                 = no
req_extensions         = v3_ca

[ req_distinguished_name ]
C = $SSL_C
ST = $SSL_ST
L = $SSL_L
O = $SSL_O
OU = $SSL_OU
CN = $SSL_CN
emailAddress = $SSL_EMAIL
 
[ req_attributes ]
challengePassword = password

[ v3_ca ]
subjectAltName = IP:$NET_IP
authorityInfoAccess = @issuer_info

[ issuer_info ]
OCSP;URI.0 = http://$NET_IP/
caIssuers;URI.0 = http://$NET_IP/ca.cert
EOF



# To simplify the configuration, let’s grab the following CA configuration file.

# Next, we’ll create a new certificate authority using this configuration.
openssl req -new -x509 -days 9999 -config ca.cnf -keyout ca-key.pem -out ca-crt.pem


# strip the password from the key so nginx wont ask for it
# openssl rsa  -passin "pass:password" -in ca-key-secure.pem -out ca-key.pem

# Now that we have our certificate authority in ca-key.pem and ca-crt.pem,
# let’s generate a private key for the server.
openssl genrsa -out server-key.pem 4096

# Our next move is to generate a certificate signing request. Again to simplify configuration,
# let’s use server.cnf as a configuration shortcut.

# Now we’ll generate the certificate signing request.
openssl req -new -config server.cnf -key server-key.pem -out server-csr.pem

# Now let’s sign the request.
openssl x509 -req -extfile server.cnf -days $SSL_DAYS  -passin "pass:password" -in server-csr.pem -CA ca-crt.pem -CAkey ca-key.pem -CAcreateserial -out server-crt.pem

# verify the server certs.
openssl verify -CAfile ca-crt.pem server-crt.pem

# copy over the keys to files
cp server-key.pem  ../nginx/server-key.pem
cp server-crt.pem ../nginx/server-crt.pem
cp server-crt.pem ../primary/server-crt.pem
cp server-crt.pem ../secondary/server-crt.pem
rm server.cnf
