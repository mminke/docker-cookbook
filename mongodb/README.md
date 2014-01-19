MongoDB container recipe
===============

This recipe contains a MongoDB server setup using the downloadable tar from the mongodb distribution.
This is done on purpose to have minimal dependencies with ubuntu packages and they way they are installed.

# Pulling from the Docker Index

The recipe is also used to create an trusted image, available on the Docker Index under: mminke/mongodb.
To pull this repository execute the following command:

```
$ sudo docker pull mminke/mongodb
```

# Building the image

To build the image yourself use the following command:

```
$ sudo docker build -t [your tag] .
```

# Using the image

To use the image different options are available. Per default, the image is configured to use a volume for the data of the database.
This way the data is never part of the container and will not be committed into a new image (this is something you do NOT want).
With this default setup, docker will create a volume directory on your host system to store this data outside of the container filesystem.

So the simplest way to start the container is:

```
$ sudo docker run -d mminke/mongodb
```
This will start the MongoDB instance detached with the default settings. To check if the container is running use 'docker ps'.
The MongoDB server container which you just started is only available from within the container itself or from another container. 
You cannot however access the container from the host running docker, or from another host in the network.

```
$ sudo docker run -d -p 27017:27017 mminke/mongodb
```
This command binds the port 27017 on the host to the port 27017 on the container and therefor makes it accessible to the outside world of the host running docker.

To link the data volume on the container to a local folder on the host (i.e. to make it easier to backup the data) use the following command:
```
$ sudo docker run -d -v /mydata/mongodb:/data/db mminke/mongodb
```
This command mount the host volume of /mydata/mongodb to the containers directory /data/db.

# Connecting to the server container from within a mongo client container
The image can also be used as a mongo client container. Use the following command to connect to the server container with the given ip address.
Offcourse the ip adres can differ in your situation!
```
$ sudo docker run -i -t  mongodb /opt/mongodb/bin/mongo 172.17.0.9
```
