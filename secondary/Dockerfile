FROM docker.bintray.io/jfrog/artifactory-pro:5.3.0

RUN rm /var/opt/jfrog/artifactory/etc/db.properties || true
COPY binarystore.xml /var/opt/jfrog/artifactory/etc/
COPY ha-node.properties /var/opt/jfrog/artifactory/etc/
