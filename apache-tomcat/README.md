Apache Tomcat container recipe
===============

This recipe contains a Apache Tomcat server setup using the downloadable tar from the Apache distribution.
This is done on purpose to have minimal dependencies with ubuntu packages and the way they are installed.

# Pulling from the Docker Index

The recipe is also used to create an trusted image, available on the Docker Index under: mminke/apache-tomcat-7.0.50.
Unfortunately due to the way Docker Index works, it is not possible to create a repository for apache-tomcat with multiple versions in it.
I have tried that but that did not work :-(
So for each update you have to pull a new repo.

To pull this repository execute the following command:

```
$ sudo docker pull mminke/apache-tomcat-7.0.50
```

# Using the image

This image is nothing without a web application to deploy on/in it. One of the ways to do is is to create another Dockerfile 
which uses this image and adds additional functionality.

An example Dockerfile is given below:

```
FROM mminke/apache-tomcat-7.0.50

MAINTAINER Morten Minke

ADD conf/zikru-config.properties /opt/zikru/conf/zikru-config.properties

ADD zikru-web.war /opt/apache-tomcat-7.0.50/webapps/zikru.war

ENV ZIKRU_HOME /opt/zikru
```
The above Dockerfile asumes the folowing filestructure to build the image:

/Dockerfile
/zikru.war
/conf/zikru-config.properties

Using this structure the war and configuration are added to the image and an environment variable is set to let the 
webapplication know where to find the configuration file. How to do this for a different web application depends on the configuration
possibilities.


After building this image, you can run it using the following command:

```
sudo docker run -p 80:8080 zikru
```
The above command runs a container based on the image build created above. In this example, the port 8080 on the container (tomcat) 
is mapped to port 80 on the host.
