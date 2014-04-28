# The base image on which this image is based
FROM mminke/oracle-java-server-jre:1.8.0_05

MAINTAINER Morten Minke

RUN wget -nv --no-cookies http://mirrors.jenkins-ci.org/war/latest/jenkins.war -O /opt/jenkins.war

# The following volumes should not be considered part of the image, but contain runtime data
VOLUME ["~/.jenkins", "/tmp/hsperfdata_root"]

# Start Tomcat in the foreground (run) to make sure docker does not immediately shutdown the container
CMD ["java", "-jar", "/opt/jenkins.war"]
