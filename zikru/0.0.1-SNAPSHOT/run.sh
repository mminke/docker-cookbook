#!/bin/bash

# This script is an example how to run a zikru container. For this to work, another container with mongo db should be running, in this example this container as
# ip address 172.17.0.2, change this according to the situation.
#
# Zikru will be exposed through port 8090 on the host running the zikru image.
#
# To test zikru, open a browser and go to the url: http://localhost:8090/zikru-frontend-webapp/

sudo docker run -d -e "MONGODB_SERVER_URL=172.17.0.2" -e "ZIKRU_BACKEND_WEBSERVICE_URL=http://localhost:8080/zikru-backend-webservice" -p 8090:8080 mminke/zikru:0.0.1-SNAPSHOT