FROM docker.bintray.io/jfrog/artifactory-pro:5.4.3

COPY bootstrap.bundle.tar.gz /var/opt/jfrog/artifactory/etc/

COPY server.crt /server.crt
RUN keytool -importcert -keystore /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/cacerts -storepass changeit -file /server.crt -noprompt
