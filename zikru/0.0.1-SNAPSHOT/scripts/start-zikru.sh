#!/bin/bash

# Create config file using environment variables
sed -e s,MONGODB_SERVER_URL,$MONGODB_SERVER_URL, -e s,ZIKRU_BACKEND_WEBSERVICE_URL,$ZIKRU_BACKEND_WEBSERVICE_URL, $ZIKRU_HOME/conf/zikru-config.properties.template >$ZIKRU_HOME/conf/zikru-config.properties

echo ====================================================================
echo Using environment:
echo --------------------------------------------------------------------
echo ZIKRU_HOME=$ZIKRU_HOME
echo MONGODB_SERVER_URL=$MONGODB_SERVER_URL
echo ZIKRU_BACKEND_WEBSERVICE_URL=$ZIKRU_BACKEND_WEBSERVICE_URL
echo CATALINA_HOME=$CATALINA_HOME
echo ====================================================================
echo Using zikru-config.properties:
echo --------------------------------------------------------------------
cat $ZIKRU_HOME/conf/zikru-config.properties
echo ====================================================================

# Start tomcat
$CATALINA_HOME/bin/catalina.sh run
