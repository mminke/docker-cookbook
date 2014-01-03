# The base image on which this image is based
FROM mminke/oracle-java-server-jre

MAINTAINER Morten Minke

RUN wget -nv --no-cookies http://ftp.tudelft.nl/apache/tomcat/tomcat-7/v7.0.47/bin/apache-tomcat-7.0.47.tar.gz -O /tmp/apache-tomcat-7.0.47.tar.gz

# Check the checksum, if it fails, print an error message
RUN echo "efbae77efad579b655ae175754cad3df  /tmp/apache-tomcat-7.0.47.tar.gz" | md5sum -c > /dev/null 2>&1 || echo "ERROR: MD5SUM MISMATCH"

RUN tar xzf /tmp/apache-tomcat-7.0.47.tar.gz -C /opt
RUN rm /tmp/apache-tomcat-7.0.47.tar.gz

VOLUME ["/opt/apache-tomcat-7.0.47/logs", "/opt/apache-tomcat-7.0.47/work", "/opt/apache-tomcat-7.0.47/temp", "/tmp/hsperfdata_root"]

ENV CATALINA_HOME /opt/apache-tomcat-7.0.47
ENV PATH $PATH:$CATALINA_HOME/bin

# Start Tomcat in the foreground (run) to make sure docker does not immediately shutdown the container
CMD ["/opt/apache-tomcat-7.0.47/bin/cataline.sh", "run"]
