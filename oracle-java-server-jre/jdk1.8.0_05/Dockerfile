# The base image on which this image is based
FROM ubuntu:quantal

MAINTAINER Morten Minke

RUN apt-get -y install wget

RUN wget --progress=bar -nv --no-cookies --no-check-certificate --header "Cookie: gpw_e24=h" http://download.oracle.com/otn-pub/java/jdk/8u5-b13/server-jre-8u5-linux-x64.tar.gz -O /tmp/server-jre-8u5-linux-x64.tar.gz

# Create target folder and extract the archive
RUN mkdir -p /usr/lib/jvm
RUN tar xzf /tmp/server-jre-8u5-linux-x64.tar.gz -C /usr/lib/jvm

# Move to correct location
RUN mv jdk1.8.0_05 /usr/lib/jvm/java-8-oracle

# CHANGE OWNERSHIP (default is uucp!)
RUN chown root:root -R /usr/lib/jvm/java-8-oracle

# Cleanup
RUN rm /tmp/server-jre-8u5-linux-x64.tar.gz

# Enable environment
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH $PATH:$JAVA_HOME/bin
