# The base image on which this image is based
FROM mminke/oracle-java-server-jre:1.7.0_51_b13

MAINTAINER Morten Minke

RUN wget -nv --no-cookies http://ftp.nluug.nl/internet/apache/tomcat/tomcat-7/v7.0.50/bin/apache-tomcat-7.0.50.tar.gz -O /tmp/apache-tomcat-7.0.50.tar.gz

# Check the checksum, if it fails, print an error message
RUN echo "efbae77efad579b655ae175754cad3df  /tmp/apache-tomcat-7.0.50.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "ERROR: MD5SUM MISMATCH"

RUN tar xzf /tmp/apache-tomcat-7.0.50.tar.gz -C /opt
RUN rm /tmp/apache-tomcat-7.0.50.tar.gz

# The following volumes should not be considered part of the image, but contain runtime data
VOLUME ["/opt/apache-tomcat-7.0.50/logs", "/opt/apache-tomcat-7.0.50/work", "/opt/apache-tomcat-7.0.50/temp", "/tmp/hsperfdata_root"]

ENV CATALINA_HOME /opt/apache-tomcat-7.0.50
ENV PATH $PATH:$CATALINA_HOME/bin

# Start Tomcat in the foreground (run) to make sure docker does not immediately shutdown the container
CMD ["/opt/apache-tomcat-7.0.50/bin/catalina.sh", "run"]
